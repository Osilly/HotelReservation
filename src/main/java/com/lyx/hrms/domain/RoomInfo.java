package com.lyx.hrms.domain;

import com.lyx.hrms.enums.RoomStatus;

import java.io.Serializable;

/**
 * @
 * 酒店课程信息实体类
 */
public class RoomInfo implements Serializable{
    //主键id
    private Integer id;
    //房间号
    private String roomNum;
    //房间面积
    private Integer area;
    //客房主图
    private String primaryPhoto;
    //房间简介
    private String intro;
    //客房价格
    private Double price;

    @Override
    public String toString() {
        return "RoomInfo{" +
                "id=" + id +
                ", roomNum='" + roomNum + '\'' +
                ", area=" + area +
                ", primaryPhoto='" + primaryPhoto + '\'' +
                ", intro='" + intro + '\'' +
                ", price=" + price +
                ", roomCatalog=" + roomCatalog +
                ", roomStatus=" + roomStatus +
                ", version=" + version +
                '}';
    }

    //客房类别
    private RoomCatalog roomCatalog;
    //客房状态
    private RoomStatus roomStatus;
    //版本控制
    private Long version;

    public RoomInfo() {
    }

    public RoomInfo(String roomNum, Integer area, String primaryPhoto, String intro, Double price, RoomCatalog roomCatalog, RoomStatus roomStatus) {
        this.roomNum = roomNum;
        this.area = area;
        this.primaryPhoto = primaryPhoto;
        this.intro = intro;
        this.price = price;
        this.roomCatalog = roomCatalog;
        this.roomStatus = roomStatus;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum;
    }

    public Integer getArea() {
        return area;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public String getPrimaryPhoto() {
        return primaryPhoto;
    }

    public void setPrimaryPhoto(String primaryPhoto) {
        this.primaryPhoto = primaryPhoto;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public RoomCatalog getRoomCatalog() {
        return roomCatalog;
    }

    public void setRoomCatalog(RoomCatalog roomCatalog) {
        this.roomCatalog = roomCatalog;
    }

    public RoomStatus getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(RoomStatus roomStatus) {
        this.roomStatus = roomStatus;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }
}
