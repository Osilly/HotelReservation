package com.lyx.hrms.controller.admin;

import com.lyx.hrms.constant.HintConstant;
import com.lyx.hrms.domain.RoomCatalog;
import com.lyx.hrms.domain.RoomInfo;
import com.lyx.hrms.dto.CheckRoomNumDto;
import com.lyx.hrms.dto.DeleteHintDto;
import com.lyx.hrms.service.RoomInfoService;
import com.lyx.hrms.util.MyUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/super/room")
public class RoomInfoController {

    @Autowired
    private RoomInfoService roomService;

    @GetMapping("/doDeleteCatalog")
    @ResponseBody
    public DeleteHintDto doDeleteCatalog(Integer catalogId) {
        if (catalogId != null && roomService.deleteRoomCatalog(catalogId)) {
            return new DeleteHintDto(true, HintConstant.DELETE_SUCCESS);
        }
        return new DeleteHintDto(false, HintConstant.DELETE_FAILED);
    }
    //添加客房类型
    @GetMapping("/toAddCatalog")
    public String toAddCatalog() {
        return "admin/addCatalog";
    }

    @PostMapping("/doAddCatalog")
    public String doAddCatalog(RoomCatalog catalog, Model model) {
        String viewName = "redirect:../toSuper";
        if (!roomService.addRoomCatalog(catalog)) {
            model.addAttribute("hint", HintConstant.ADD_FAILED);
            viewName = "admin/addCatalog";
        }
        return viewName;
    }

    @GetMapping("/doShowRoomByCatalog")
    public String doShowRoomByCatalog(HttpServletRequest request, Integer catalogId, Integer currentPage, Integer pageSize) {
        RoomCatalog catalog = (RoomCatalog) request.getSession().getAttribute("catalog");
        if (catalog == null) {
            catalog = roomService.findCatalogById(catalogId);
            request.getSession().setAttribute("catalog", catalog);
        }
        catalogId = catalog.getId();
        request.setAttribute("roomPage", roomService.pageRoomsByCatalog(catalogId, currentPage, pageSize));
        return "admin/roomInfo";
    }

    @GetMapping("/deleteRoom")
    @ResponseBody
    public DeleteHintDto deleteRoom(String roomNum){
        if(roomService.deleteRoomInfoAndPhoto(roomNum)){
            return new DeleteHintDto(true,HintConstant.DELETE_SUCCESS);
        }
        return new DeleteHintDto(false,HintConstant.DELETE_FAILED);
    }
    //添加房间
    @GetMapping("/toAddRoom")
    public String toAddRoom() {
        return "admin/addRoom";
    }

    @GetMapping("/checkRoomNum")
    @ResponseBody
    public CheckRoomNumDto checkRoomNum(String roomNum,HttpServletRequest request) {
        System.out.println("项目目录"+request.getServletContext().getRealPath("/upload"));
        return roomService.checkRoomNum(roomNum);
    }

    @PostMapping("/doAddRoom")
    public String doAddRoom(RoomInfo room,MultipartFile primaryPhoto, HttpServletRequest request) throws IOException {
        String viewName = "redirect:/";
//        System.out.println(room.getRoomCatalog());
        //System.out.println(room);
        String path = request.getServletContext().getRealPath("/upload/room/primary/");
        String newName = null;
        if (!primaryPhoto.isEmpty()) {
            newName = MyUtils.getHashFileName(primaryPhoto.getInputStream()) + MyUtils.getFilenameSuffix(primaryPhoto.getOriginalFilename());
            primaryPhoto.transferTo(new File(path + newName));
        } else {
            newName = "default.jpg";
        }
        room.setRoomCatalog((RoomCatalog) request.getSession().getAttribute("catalog"));
        room.setPrimaryPhoto(newName);
        System.out.println(room);
        //执行添加操作
        if (!roomService.addRoomInfo(room)) {
            request.setAttribute("hint", HintConstant.ADD_FAILED);
            viewName = "admin/addRoom";
        }
        return viewName;
    }

    @GetMapping("/detailedRoomInfo")
    public String detailedRoomInfo(Model model,String roomNum){
        String viewName = "redirect:doShowRoomByCatalog";
        RoomInfo room=roomService.findRoomByRoomNum(roomNum);
        if (room!=null){
            model.addAttribute("room",room);
            model.addAttribute("roomPhotoList",roomService.listPhotosByRoomId(room.getId()));
            viewName="admin/detailedRoomInfo";
        }
        return viewName;
    }
}
