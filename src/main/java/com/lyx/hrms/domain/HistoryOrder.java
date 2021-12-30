package com.lyx.hrms.domain;

import java.io.Serializable;
import java.util.Date;

/**
 *
 */
public class HistoryOrder implements Serializable{
    //主键id
    private Integer id;
    //谁处理的订单
    private Admin admin;
    //订单
    private Reservation reservation;
    //退房时间
    private Date checkOutDate;


    public HistoryOrder() {
    }

    public HistoryOrder(Admin admin, Reservation reservation) {
        this.admin = admin;
        this.reservation = reservation;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Reservation getReservation() {
        return reservation;
    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }
}
