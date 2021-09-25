package com.example.webtoon.model.freeboard_comment_reply.dto;

import java.sql.Date;

public class Fc_replyDTO {

	private int idx;
	private int fc_idx;
	private String username;
	private String email;
	private String content;
	private Date write_date;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getFc_idx() {
		return fc_idx;
	}
	public void setFc_idx(int fc_idx) {
		this.fc_idx = fc_idx;
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
	@Override
	public String toString() {
		return "Fc_replyDTO [idx=" + idx + ", fc_idx=" + fc_idx + ", username=" + username + ", email=" + email
				+ ", content=" + content + ", write_date=" + write_date + "]";
	}
	
	
	
	
}
