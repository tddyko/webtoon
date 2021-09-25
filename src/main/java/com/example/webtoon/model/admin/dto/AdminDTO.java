package com.example.webtoon.model.admin.dto;

public class AdminDTO {
	private String admin;
	private String passwd;
	
	AdminDTO(){}
	
	public AdminDTO(String admin, String passwd) {
		super();
		this.admin = admin;
		this.passwd = passwd;
	}

	
	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	@Override
	public String toString() {
		return "AdminDTO [admin=" + admin + ", passwd=" + passwd + "]";
	}

	
}
