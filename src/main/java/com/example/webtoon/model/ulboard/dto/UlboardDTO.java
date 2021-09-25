package com.example.webtoon.model.ulboard.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class UlboardDTO {
	private int idx;
	private String title;
	private String username;
	private int viewcount;
	private String content;
	private Date write_date;
	private String email;
	private String img_url;
	private int heart;
	// 업로드 한 파일이 저장되는 객체
	private MultipartFile imgfile;
	
	public UlboardDTO() {}
	
	public UlboardDTO(int idx, String title, String username, int viewcount, String content, Date write_date,
			String email, String img_url) {
		super();
		this.idx = idx;
		this.title = title;
		this.username = username;
		this.viewcount = viewcount;
		this.content = content;
		this.write_date = write_date;
		this.email = email;
		this.img_url = img_url;

	}


	@Override
	public String toString() {
		return "UlboardDTO [idx=" + idx + ", title=" + title + ", username=" + username + ", viewcount=" + viewcount
				+ ", content=" + content + ", write_date=" + write_date + ", email=" + email + ", img_url=" + img_url
				+ ", heart=" + heart + ", imgfile=" + imgfile + "]";
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

	public String getImg_url() {
		return img_url;
	}

	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}

	public MultipartFile getImgfile() {
		return imgfile;
	}

	public void setImgfile(MultipartFile imgfile) {
		this.imgfile = imgfile;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}
	
	
	
}