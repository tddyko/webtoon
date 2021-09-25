package com.example.webtoon.model.webtoon.dto;

import org.springframework.web.multipart.MultipartFile;

public class WebtoonDTO {
	private int idx;
	private String title;
	private String category;
	private String finish;
	private String image;
	private String week;
	private double heart;
	private String summary;
	private String visibility;
	private MultipartFile file;
	
	public WebtoonDTO(){}

	public WebtoonDTO(int idx, String title, String category, String finish, String image, String week, double heart,
			String summary, String visibility, MultipartFile file) {
		super();
		this.idx = idx;
		this.title = title;
		this.category = category;
		this.finish = finish;
		this.image = image;
		this.week = week;
		this.heart = heart;
		this.summary = summary;
		this.visibility = visibility;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFinish() {
		return finish;
	}

	public void setFinish(String finish) {
		this.finish = finish;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public double getHeart() {
		return heart;
	}

	public void setHeart(double heart) {
		this.heart = heart;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getVisibility() {
		return visibility;
	}

	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "WebtoonDTO [idx=" + idx + ", title=" + title + ", category=" + category + ", finish=" + finish
				+ ", image=" + image + ", week=" + week + ", heart=" + heart + ", summary=" + summary + ", visibility="
				+ visibility + ", file=" + file + "]";
	}


	
	

}
