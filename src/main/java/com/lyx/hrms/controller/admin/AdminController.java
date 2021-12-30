package com.lyx.hrms.controller.admin;

import com.lyx.hrms.constant.HintConstant;
import com.lyx.hrms.domain.Admin;
import com.lyx.hrms.dto.CheckCodeResult;
import com.lyx.hrms.dto.LoginDto;
import com.lyx.hrms.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/toLogin")
    public String toLogin(String hint, Model model) {
        model.addAttribute("hint", hint);
        return "admin/login";
    }

    @PostMapping("/doLogin")
    public String login(LoginDto loginDto, HttpServletRequest request) {
        String viewName = "admin/login";
        System.out.println(loginDto);
        String imageCode = request.getSession().getAttribute("code").toString();
        if (imageCode != null && imageCode.equals(loginDto.getCode())) {
            Admin admin = adminService.login(loginDto);
            System.out.println("admin"+admin);
            if (admin != null) {
                request.getSession().setAttribute("admin", admin);
                viewName = "redirect:toOperate";
            } else {
                request.setAttribute("hint", HintConstant.LOGIN_FAILED);
            }
        } else {
            request.setAttribute("hint", HintConstant.CODE_FAILED);
        }
        return viewName;
    }

    @GetMapping("/toOperate")
    public String toOperate(String hint, Model model) {
        model.addAttribute("hint", hint);
        return "admin/operate";
    }

    @GetMapping("/doLogout")
    public String doLogout(HttpSession session) {
        session.removeAttribute("admin");
        return "redirect:toLogin";
    }

    @GetMapping("/doCheckCode")
    @ResponseBody
    public CheckCodeResult checkCode(String code, HttpSession session) {
        System.out.println("提交的验证码="+code);
        boolean flag = false;
        String sCode = (String) session.getAttribute("code");
        if (sCode != null && code != null) {
            flag = sCode.equals(code);
        }
        return new CheckCodeResult(flag);
    }

    @GetMapping("/toUpdatePassword")
    public String toUpdatePassword() {
        return "admin/updatePassword";
    }

    @PostMapping("/updatePassword")
    public String updatePassword(String password, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        admin.setPassword(password);
        adminService.updatePassword(admin);
        session.removeAttribute("admin");
        return "admin/login";
    }
}
