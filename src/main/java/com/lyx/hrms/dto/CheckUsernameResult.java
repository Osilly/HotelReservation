package com.lyx.hrms.dto;

import java.io.Serializable;


public class CheckUsernameResult implements Serializable{

	private String username;
	private Boolean valid;	//用户名不存在（可用）-true，用户名存在（不可用）-false
	private String message;
	
	public CheckUsernameResult() {
	}

	public CheckUsernameResult(String username, Boolean valid, String message) {
		super();
		this.username = username;
		this.valid = valid;
		this.message = message;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Boolean getValid() {
		return valid;
	}

	public void setValid(Boolean valid) {
		this.valid = valid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
