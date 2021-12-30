package com.lyx.hrms.controller.user;

import com.lyx.hrms.domain.Comment;
import com.lyx.hrms.domain.RoomInfo;
import com.lyx.hrms.domain.User;
import com.lyx.hrms.service.CommentService;
import com.lyx.hrms.service.RoomInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;


@Controller
@RequestMapping("/user/comment")
public class CommentUController {

    @Autowired
    private CommentService commentService;
    @Autowired
    private RoomInfoService roomService;

    @GetMapping("/showByRoom")
    public String showByRoom(String roomNum, Integer currentPage, Integer pageSize, Model model) {
        String viewName = "user/comment";
        if (roomNum != null) {
            RoomInfo room = roomService.findRoomByRoomNum(roomNum);
            model.addAttribute("commentPage", commentService.pageComment(room, currentPage, pageSize));
            model.addAttribute("room", room);
        }
        return viewName;
    }

    @GetMapping("/toPublish")
    public String toPublish(String roomNum,Model model){
        model.addAttribute("roomNum",roomNum);
        return "/user/publishComment";
    }

    @PostMapping("/publish")
    public String publish(Comment comment, String roomNum, HttpSession session) throws UnsupportedEncodingException {
        User user= (User) session.getAttribute("user");
        RoomInfo room=roomService.findRoomByRoomNum(roomNum);
        comment.setPubDate(new Date());
        comment.setUser(user);
        comment.setRoomInfo(room);
        commentService.add(comment);
        return "redirect:showByRoom?roomNum="+ URLEncoder.encode(roomNum,"utf-8");
    }
}
