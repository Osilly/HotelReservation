package com.lyx.hrms.domain;

import com.lyx.hrms.enums.ReservationStatus;

import java.io.Serializable;
import java.util.Date;

/**
 *
 */
public class Reservation implements Serializable{
    //主键id
    private Integer id;
    //预订单的状态-枚举类型
    private ReservationStatus reservationStatus;
    //下单时间
    private Date orderTime;
    //预订的天数-默认预订一天
    private Integer days=1;
    //预订的入住时间
    private Date checkInTime;
    //入住人姓名
    private String checkInName;
    //入住人联系电话
    private String checkInPhone;
    //下单用户
    private User user;
    //预订的房间
    private RoomInfo roomInfo;

    public Reservation() {
    }

    public Reservation(ReservationStatus reservationStatus, Date orderTime, Integer days, Date checkInTime, String checkInName, String checkInPhone, User user, RoomInfo roomInfo) {
        this.reservationStatus = reservationStatus;
        this.orderTime = orderTime;
        this.days = days;
        this.checkInTime = checkInTime;
        this.checkInName = checkInName;
        this.checkInPhone = checkInPhone;
        this.user = user;
        this.roomInfo = roomInfo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ReservationStatus getReservationStatus() {
        return reservationStatus;
    }

    public void setReservationStatus(ReservationStatus reservationStatus) {
        this.reservationStatus = reservationStatus;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public Date getCheckInTime() {
        return checkInTime;
    }

    public void setCheckInTime(Date checkInTime) {
        this.checkInTime = checkInTime;
    }

    public String getCheckInName() {
        return checkInName;
    }

    public void setCheckInName(String checkInName) {
        this.checkInName = checkInName;
    }

    public String getCheckInPhone() {
        return checkInPhone;
    }

    public void setCheckInPhone(String checkInPhone) {
        this.checkInPhone = checkInPhone;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public RoomInfo getRoomInfo() {
        return roomInfo;
    }

    public void setRoomInfo(RoomInfo roomInfo) {
        this.roomInfo = roomInfo;
    }
}
