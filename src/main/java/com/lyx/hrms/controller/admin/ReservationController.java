package com.lyx.hrms.controller.admin;

import com.lyx.hrms.constant.HintConstant;
import com.lyx.hrms.domain.Admin;
import com.lyx.hrms.domain.Reservation;
import com.lyx.hrms.domain.User;
import com.lyx.hrms.enums.ReservationStatus;
import com.lyx.hrms.service.ReservationService;
import com.lyx.hrms.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/reservation")
public class ReservationController {

    private final String ORDER_TIME = "orderTime";

    private final String ZH_ORDER_TIME = "下单时间";

    private final String CHECK_IN_TIME = "checkInTime";

    private final String ZH_CHECK_IN_TIME = "入住时间";

    @Autowired
    private UserService userService;

    @Autowired
    private ReservationService reservationService;

    @GetMapping("/toShowUserReservation")
    public String toShowUserReservation() {
        return "admin/showUserReservation";
    }

    @GetMapping("/doShowAllReservation")
    public String doShowAllReservation(Model model, String flag, Integer currentPage, Integer pageSize) {
        String timeRule=null;
        if (flag == null || !CHECK_IN_TIME.equals(flag)) {
            flag = ORDER_TIME;
            timeRule=ZH_ORDER_TIME;
        }else{
            timeRule=ZH_CHECK_IN_TIME;
        }
        model.addAttribute("flag",flag);
        model.addAttribute("timeRule",timeRule);
        model.addAttribute("reservationPage", reservationService.listReservationByTime(flag, currentPage, pageSize));
        return "admin/reservationByTime";
    }

    @PostMapping("/doShowReservation")
    public String doShowReservation(String username, Model model) {
        String viewName = "admin/showUserReservation";
        User user = userService.findByUsername(username);
        if (user != null) {
            List<Reservation> reservationList = reservationService.listReservationByUserId(user.getId());
            if (reservationList.isEmpty()) {
                model.addAttribute("hint", HintConstant.NO_RESERVATION);
            } else {
                model.addAttribute("reservationList", reservationList);
                model.addAttribute("user", user);
                viewName = "admin/reservation";
            }
        } else {
            model.addAttribute("hint", HintConstant.NO_USERNAME);
        }
        return viewName;
    }

    //办理入住
    @GetMapping("/dealProcessed")
    @ResponseBody
    public Boolean dealProcessed(Integer reservationId){
        return reservationService.modifyReservationStatus(ReservationStatus.PROCESSED,reservationId,null);
    }

    //办理退房
    @GetMapping("/dealCleared")
    @ResponseBody
    public Boolean dealCleared(HttpSession session, Integer reservationId){
        Admin admin= (Admin) session.getAttribute("admin");
        return reservationService.modifyReservationStatus(ReservationStatus.CLEARED,reservationId,admin.getId());
    }
}
