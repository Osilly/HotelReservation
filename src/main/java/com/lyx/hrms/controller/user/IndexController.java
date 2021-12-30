package com.lyx.hrms.controller.user;

import com.lyx.hrms.domain.RoomInfo;
import com.lyx.hrms.service.PromotionService;
import com.lyx.hrms.service.RoomInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private PromotionService promotionService;
    @Autowired
    private RoomInfoService roomInfoService;

    @GetMapping(value = {"toIndex", "/"})
    public String toIndex(Model model) {
        model.addAttribute("promotionList", promotionService.listAll());
        List<RoomInfo> roomInfoList = roomInfoService.getSomeForIndex();
        model.addAttribute("roomList", roomInfoList.subList(0, 3));
        for (RoomInfo room : roomInfoList) {
            System.out.println(room);
        }
        return "user/index";
    }
}
