package com.aaa.entity;

import java.sql.Date;

public class SysLogVo {

	private Integer LoginID;
	private String UID;
	private Date LoginDate;
	private String Note;

	public Integer getLoginID() {
		return LoginID;
	}

	public void setLoginID(Integer loginID) {
		LoginID = loginID;
	}

	public String getUID() {
		return UID;
	}

	public void setUID(String uID) {
		UID = uID;
	}

	public Date getLoginDate() {
		return LoginDate;
	}

	public void setLoginDate(Date loginDate) {
		LoginDate = loginDate;
	}

	public String getNote() {
		return Note;
	}

	public void setNote(String note) {
		Note = note;
	}

}
