package com.lyx.hrms.domain;

import java.io.Serializable;

/**
 *
 */
public class RoomPhoto implements Serializable{
    //主键id
    private Integer id;
    //客房图片路径
    private String photoPath;
    //对应的客房
    private RoomInfo roomInfo;

    public RoomPhoto() {
    }

    public RoomPhoto(String photoPath, RoomInfo roomInfo) {
        this.photoPath = photoPath;
        this.roomInfo = roomInfo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public RoomInfo getRoomInfo() {
        return roomInfo;
    }

    public void setRoomInfo(RoomInfo roomInfo) {
        this.roomInfo = roomInfo;
    }
}
