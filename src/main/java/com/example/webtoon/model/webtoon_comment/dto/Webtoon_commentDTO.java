package com.example.webtoon.model.webtoon_comment.dto;

import java.sql.Date;

public class Webtoon_commentDTO {

private int idx ;
private String title;
private int no;
private String username;
private String email;
private String content;
private Date write_date;
private int heart;
private int hate;

public int getIdx() {
	return idx;
}
public void setIdx(int idx) {
	this.idx = idx;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
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
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}

public int getHate() {
	return hate;
}
public void setHate(int hate) {
	this.hate = hate;
}
public int getHeart() {
	return heart;
}
public void setHeart(int heart) {
	this.heart = heart;
}
public Date getWrite_date() {
	return write_date;
}
public void setWrite_date(Date write_date) {
	this.write_date = write_date;
}



	
}
