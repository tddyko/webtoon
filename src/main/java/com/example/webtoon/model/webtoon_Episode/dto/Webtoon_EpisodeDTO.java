package com.example.webtoon.model.webtoon_Episode.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Webtoon_EpisodeDTO {
	private int idx;
	private String title;
	private int no;
	private String no_title;
	private int viewcount;
	private double star;
	private Date write_date;
	private String image;
	private String visibility;
	private String cost;
	private int coin;
	private MultipartFile file;
	
	Webtoon_EpisodeDTO(){}

	public Webtoon_EpisodeDTO(int idx, String title, int no, String no_title, int viewcount, double star,
			Date write_date, String image, String visibility, String cost, int coin, MultipartFile file) {
		super();
		this.idx = idx;
		this.title = title;
		this.no = no;
		this.no_title = no_title;
		this.viewcount = viewcount;
		this.star = star;
		this.write_date = write_date;
		this.image = image;
		this.visibility = visibility;
		this.cost = cost;
		this.coin = coin;
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

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getNo_title() {
		return no_title;
	}

	public void setNo_title(String no_title) {
		this.no_title = no_title;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getVisibility() {
		return visibility;
	}

	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public int getCoin() {
		return coin;
	}

	public void setCoin(int coin) {
		this.coin = coin;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "Webtoon_EpisodeDTO [idx=" + idx + ", title=" + title + ", no=" + no + ", no_title=" + no_title
				+ ", viewcount=" + viewcount + ", star=" + star + ", write_date=" + write_date + ", image=" + image
				+ ", visibility=" + visibility + ", cost=" + cost + ", coin=" + coin + ", file=" + file + "]";
	}

	

	
	
}
