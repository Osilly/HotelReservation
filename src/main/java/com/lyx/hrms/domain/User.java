package com.lyx.hrms.domain;

import java.io.Serializable;

/**
 *
 */
public class User implements Serializable{
	// 用户主键
	private Integer id;
	// 用户名
	private String username;
	// 用户登录密码
	private String password;
	// 用户邮箱
	private String email;
	// 用户电话号码
	private String phone;
	// 用户真实姓名
	private String realName;
	//性别
	private String gender ="男";
	//用户头像
	private String photoPath;
	//用户状态 默认 1 可用，0 不可用
	private Integer status;

	public User() {
	}

	public User(String username, String password, String email, String phone, String realName, String gender, String photoPath) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.phone = phone;
		this.realName = realName;
		this.gender = gender;
		this.photoPath = photoPath;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
}
