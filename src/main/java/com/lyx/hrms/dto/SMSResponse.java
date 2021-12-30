package com.lyx.hrms.dto;

import java.io.Serializable;


public class SMSResponse implements Serializable{

    private Boolean success;

    public SMSResponse() {
    }

    public SMSResponse(Boolean success) {
        this.success = success;
    }

    public Boolean getSuccess() {
        return success;
    }

    public void setSuccess(Boolean success) {
        this.success = success;
    }
}
