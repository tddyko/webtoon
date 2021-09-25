package com.example.webtoon.model.main_advertising.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Main_AdvertisingDTO {
	private int idx;
	private String title;
	private String type;
	private int fee;
	private Date ad_start;
	private Date ad_end;
	private String ad_image; // url
	private String summary;
	private MultipartFile file;
	
	
	public Main_AdvertisingDTO(){}


	public Main_AdvertisingDTO(int idx, String title, String type, int fee, Date ad_start, Date ad_end, String ad_image,
			String summary, MultipartFile file) {
		super();
		this.idx = idx;
		this.title = title;
		this.type = type;
		this.fee = fee;
		this.ad_start = ad_start;
		this.ad_end = ad_end;
		this.ad_image = ad_image;
		this.summary = summary;
		this.file = file;
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


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public int getFee() {
		return fee;
	}


	public void setFee(int fee) {
		this.fee = fee;
	}


	public Date getAd_start() {
		return ad_start;
	}


	public void setAd_start(Date ad_start) {
		this.ad_start = ad_start;
	}


	public Date getAd_end() {
		return ad_end;
	}


	public void setAd_end(Date ad_end) {
		this.ad_end = ad_end;
	}


	public String getAd_image() {
		return ad_image;
	}


	public void setAd_image(String ad_image) {
		this.ad_image = ad_image;
	}


	public String getSummary() {
		return summary;
	}


	public void setSummary(String summary) {
		this.summary = summary;
	}


	public MultipartFile getFile() {
		return file;
	}


	public void setFile(MultipartFile file) {
		this.file = file;
	}


	@Override
	public String toString() {
		return "Main_AdvertisingDTO [idx=" + idx + ", title=" + title + ", type=" + type + ", fee=" + fee
				+ ", ad_start=" + ad_start + ", ad_end=" + ad_end + ", ad_image=" + ad_image + ", summary=" + summary
				+ ", file=" + file + "]";
	}

	






	

	
	
	

	
	
	
	
}
