package com.lyx.hrms.service;

import com.lyx.hrms.domain.RoomCatalog;
import com.lyx.hrms.domain.RoomInfo;
import com.lyx.hrms.domain.RoomPhoto;
import com.lyx.hrms.dto.CheckRoomNumDto;
import com.lyx.hrms.dto.PageQueryResult;

import java.util.List;

/**
 *
 */
public interface RoomInfoService {
    List<RoomInfo> getSomeForIndex();

    boolean addRoomCatalog(RoomCatalog catalog);

    boolean deleteRoomCatalog(Integer catalogId);

    List<RoomCatalog> listAllCatalog();

    boolean addRoomInfo(RoomInfo roomInfo);

    boolean addPhoto(RoomPhoto photo);

    CheckRoomNumDto checkRoomNum(String roomNum);

    boolean deleteRoomInfoAndPhoto(String roomNum);

    void deletePhoto(Integer photoId);

    boolean updateRoomInfo(RoomInfo roomInfo);

    RoomCatalog findCatalogById(Integer catalogId);

    RoomInfo findRoomByRoomNum(String roomNum);

    List<RoomPhoto> listPhotosByRoomId(Integer roomId);

    PageQueryResult<RoomInfo> pageRoomsByCatalog(Integer catalogId,Integer currentPage,Integer pageSize);

    PageQueryResult<RoomInfo> pageAllRoom(Integer currentPage,Integer pageSize);
}
