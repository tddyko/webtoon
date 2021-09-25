package com.example.webtoon.model.ulboard_comment.dto;

import java.sql.Date;

public class UcDTO {
	
	private int idx;
	private int ulboard_idx;
	private String username;
	private String email;
	private String content;
	private Date write_date;
	private int replyCount;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getUlboard_idx() {
		return ulboard_idx;
	}
	public void setUlboard_idx(int ulboard_idx) {
		this.ulboard_idx = ulboard_idx;
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
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
	
}
