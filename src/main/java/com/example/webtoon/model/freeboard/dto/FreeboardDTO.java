package com.example.webtoon.model.freeboard.dto;

import java.sql.Date;

public class FreeboardDTO {
private int idx;
private String title;
private String username;
private int viewcount;
private String content;
private Date write_date;
private String email;
private int commentCount;



public int getCommentCount() {
	return commentCount;
}
public void setCommentCount(int commentCount) {
	this.commentCount = commentCount;
}
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
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public int getViewcount() {
	return viewcount;
}
public void setViewcount(int viewcount) {
	this.viewcount = viewcount;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getWrite_date() {
	return write_date;
}
public void setWrite_date(Date write_date) {
	this.write_date = write_date;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}


}
