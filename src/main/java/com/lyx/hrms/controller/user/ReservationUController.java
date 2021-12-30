package com.lyx.hrms.controller.user;

import com.lyx.hrms.constant.HintConstant;
import com.lyx.hrms.domain.Reservation;
import com.lyx.hrms.domain.RoomInfo;
import com.lyx.hrms.domain.User;
import com.lyx.hrms.enums.ReservationStatus;
import com.lyx.hrms.service.ReservationService;
import com.lyx.hrms.service.RoomInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/user/reservation")
public class ReservationUController {

    @Autowired
    private ReservationService reservationService;
    @Autowired
    private RoomInfoService roomService;

    @GetMapping("/showByUser")
    public String toShowReservationByUser(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        request.setAttribute("reservationList", reservationService.listReservationByUserId(user.getId()));
        return "/user/reservation";
    }

    @GetMapping("/order")
    public String toOrder(String roomNum, Model model) {
        model.addAttribute("roomNum", roomNum);
        return "user/orderInfo";
    }

    @PostMapping("/addByUser")
    public String addByUser(String roomNum, Reservation reservation,HttpServletRequest request) {
        RoomInfo room = roomService.findRoomByRoomNum(roomNum);
        if (room != null) {
            User user = (User) request.getSession().getAttribute("user");
            reservation.setUser(user);
            reservation.setRoomInfo(room);
            reservation.setOrderTime(new Date());
            if (reservationService.saveReservation(reservation)) {
                return "redirect:showByUser";
            } else {
                request.setAttribute("hint", HintConstant.ORDER_FAILED_STATUS);
            }
        } else {
            request.setAttribute("hint", HintConstant.ORDER_FAILED_NO_ROOM);
        }
        return "user/orderInfo";
    }

    @GetMapping("/cancel")
    public String cancel(Integer reservationId, Model model) {
        String viewName = "redirect:showByUser";
        if (!reservationService.modifyReservationStatus(ReservationStatus.REVOKING, reservationId, null)) {
            model.addAttribute("hint", HintConstant.CANCEL_FAILED);
        }
        return viewName;
    }
}
