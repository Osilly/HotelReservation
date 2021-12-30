package com.lyx.hrms.dto;

import javax.validation.constraints.Pattern;
import java.io.Serializable;


public class UserRegisterDto implements Serializable{
	// 用户名
	@Pattern(regexp = "^[a-zA-z]\\w{6,18}$")
	private String username;
	// 用户登录密码
	//不能全是符号,或是字母，或是数字，8-32位
	@Pattern(regexp = "(\\d*)")
	private String password;
	// 重复密码
	@Pattern(regexp = "(\\d*)")
	private String rePassword;
	// 用户邮箱
	@Pattern(regexp = "^(\\w)+(\\.\\w+)*@(\\w)+((\\.\\w{2,3}){1,3})$")
	private String email;
	// 用户电话号码
	@Pattern(regexp = "^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,3,5-9]))\\d{8}$")
	private String phone;
	//用户性别
	private String gender;
	// 用户真实姓名
	private String realName;
	//用户头像路径
	private String photoPath;
	//验证码
	private String code;
	
	public UserRegisterDto() {
	}

	public UserRegisterDto(String username, String password, String rePassword, String email, String phone, String gender, String realName, String photoPath) {
		this.username = username;
		this.password = password;
		this.rePassword = rePassword;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.realName = realName;
		this.photoPath = photoPath;
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

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPhotoPath() {
		return photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
