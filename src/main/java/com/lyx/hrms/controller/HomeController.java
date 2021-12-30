package com.lyx.hrms.controller;

import com.lyx.hrms.util.MyUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;

@Controller
public class HomeController {

    @GetMapping(value = "getImageCode", produces = "image/png")
    @ResponseBody
    public BufferedImage getImageCode(HttpSession session) {
        String code = MyUtils.getRandomCode(4);
        System.out.println("图片验证码===" + code);
        session.setAttribute("code", code);
        return MyUtils.getRandomCodeImage(code, 80, 30);
    }
}
