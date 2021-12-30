package com.lyx.hrms.dto;

import java.io.Serializable;


public class CheckCodeResult implements Serializable{
    private Boolean success;

    public CheckCodeResult() {
    }

    public CheckCodeResult(Boolean success) {
        this.success = success;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }
}
