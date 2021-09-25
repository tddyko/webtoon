package com.example.webtoon.model.member.dto;

import java.sql.Date;

public class MemberDTO {
private int idx;
private String username;
private String email;
private String passwd;
private Date reg_date;
private int coin;
private String phone;

public MemberDTO() {
	// TODO Auto-generated constructor stub
}

public int getIdx() {
	return idx;
}

public void setIdx(int idx) {
	this.idx = idx;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getPasswd() {
	return passwd;
}

public void setPasswd(String passwd) {
	this.passwd = passwd;
}



public Date getReg_date() {
	return reg_date;
}

public void setReg_date(Date reg_date) {
	this.reg_date = reg_date;
}

public int getCoin() {
	return coin;
}

public void setCoin(int coin) {
	this.coin = coin;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

@Override
public String toString() {
	return "MemberDTO [idx=" + idx + ", username=" + username + ", email=" + email + ", passwd=" + passwd + ", date="
			+ reg_date + ", coin=" + coin + ", phone=" + phone + "]";
}


	
}
