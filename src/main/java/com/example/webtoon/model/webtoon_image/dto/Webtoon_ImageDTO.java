package com.example.webtoon.model.webtoon_image.dto;

import org.springframework.web.multipart.MultipartFile;

public class Webtoon_ImageDTO {
	private int idx;
	private String title;
	private int no;
	private int image;
	private MultipartFile file;
	
	public Webtoon_ImageDTO(){
		
	}

	public Webtoon_ImageDTO(int idx, String title, int no, int image, MultipartFile file) {
		super();
		this.idx = idx;
		this.title = title;
		this.no = no;
		this.image = image;
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

	public int getImage() {
		return image;
	}

	public void setImage(int image) {
		this.image = image;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "Webtoon_ImageDTO [idx=" + idx + ", title=" + title + ", no=" + no + ", image=" + image + ", file="
				+ file + "]";
	}


	
	
	
	

}
