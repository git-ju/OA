package com.aaa.entity;

import java.sql.Date;

public class UserVo {

	private String UID;// 用户工号ID
	private String Uname;// 员工姓名
	private String Upwd;// 员工密码
	private String Url;// 员工头像
	private Integer RoleID;// 角色ID
	private String Sex;// 性别
	private String Phone;// 手机号
	private Date Birthday;// 出生日期
	private Date InDate;// 入职日期
	private Date RegularDate;// 转正日期
	private Date OffDate;// 离职日期
	private Integer TakeOfficeState;// 员工任职状态
	private Integer workState;// 员工工作状态
	private String Note;// 职责备注

	public String getUID() {
		return UID;
	}

	public void setUID(String uID) {
		UID = uID;
	}

	public String getUname() {
		return Uname;
	}

	public void setUname(String uname) {
		Uname = uname;
	}

	public String getUpwd() {
		return Upwd;
	}

	public void setUpwd(String upwd) {
		Upwd = upwd;
	}

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
	}

	public Integer getRoleID() {
		return RoleID;
	}

	public void setRoleID(Integer roleID) {
		RoleID = roleID;
	}

	public String getSex() {
		return Sex;
	}

	public void setSex(String sex) {
		Sex = sex;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public Date getBirthday() {
		return Birthday;
	}

	public void setBirthday(Date birthday) {
		Birthday = birthday;
	}

	public Date getInDate() {
		return InDate;
	}

	public void setInDate(Date inDate) {
		InDate = inDate;
	}

	public Date getRegularDate() {
		return RegularDate;
	}

	public void setRegularDate(Date regularDate) {
		RegularDate = regularDate;
	}

	public Date getOffDate() {
		return OffDate;
	}

	public void setOffDate(Date offDate) {
		OffDate = offDate;
	}

	public Integer getTakeOfficeState() {
		return TakeOfficeState;
	}

	public void setTakeOfficeState(Integer takeOfficeState) {
		TakeOfficeState = takeOfficeState;
	}

	public Integer getWorkState() {
		return workState;
	}

	public void setWorkState(Integer workState) {
		this.workState = workState;
	}

	public String getNote() {
		return Note;
	}

	public void setNote(String note) {
		Note = note;
	}

}
