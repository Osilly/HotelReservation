package com.lyx.hrms.dto;

import java.io.Serializable;


public class CheckRoomNumDto implements Serializable {

    private String roomNum;
    private boolean valid;
    private String message;

    public CheckRoomNumDto() {
    }

    public String getRoomNum() {
        return roomNum;
    }

    public void setRoomNum(String roomNum) {
        this.roomNum = roomNum;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
