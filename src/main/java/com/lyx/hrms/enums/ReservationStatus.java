package com.lyx.hrms.enums;

import java.io.Serializable;

/**
 *
 * 酒店客房预订单的处理情况
 */
public enum ReservationStatus implements Serializable{
    REVOKING("撤销的"),
    ORDERED("预订成功"),
    PROCESSED("已办理入住"),
    CLEARED("已退房");

    private String status;

    private ReservationStatus(String status){
        this.status=status;
    }

    public String getStatus(){
        return status;
    }
}
