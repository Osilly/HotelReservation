package com.lyx.hrms.controller.admin;

import com.lyx.hrms.constant.HintConstant;
import com.lyx.hrms.domain.User;
import com.lyx.hrms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/super/user")
public class UserManageController {

    @Autowired
    private UserService userService;

    @GetMapping("/all")
    public String showPageUser(Integer currentPage, Integer pageSize, Model model){
        model.addAttribute("pageUser",userService.pageUser(currentPage,pageSize));
        return "admin/userInfo";
    }

    @PostMapping("/byUsername")
    public String byUsername(String username,Model model){
        User user=userService.findByUsername(username);
        if (user==null){
            model.addAttribute("hint", HintConstant.NO_USER);
        }else {
            model.addAttribute("userList", Arrays.asList(user));
        }
        return "admin/userBysome";
    }

    @PostMapping("/byPhone")
    public String byPhone(String phone,Model model){
        List<User> userList=userService.findByPhone(phone);
        if (userList.isEmpty()){
            model.addAttribute("hint", HintConstant.NO_USER);
        }else {
            model.addAttribute("userList", userList);
        }
        return "admin/userBysome";
    }

    @GetMapping("/modifyStatus")
    @ResponseBody
    public Boolean modifyStatus(Integer userId,String status){
        if ("1".equals(status)||"0".equals(status)){
            User user=userService.getUserById(userId);
            user.setStatus(Integer.parseInt(status));
            return userService.modifyStatus(user);
        }else {
            return false;
        }
    }
}
