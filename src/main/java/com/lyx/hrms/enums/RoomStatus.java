package com.lyx.hrms.enums;

import java.io.Serializable;

/**
 *
 */
public enum RoomStatus implements Serializable{
    LEISURE("空闲"),
    BLOCKS("已被预订"),
    OPENED("已被入住");

    private String status;

    private RoomStatus(String status){
        this.status=status;
    }

    public String getStatus(){
        return status;
    }
}
