package com.example.webtoon.model.webtoon_star.dto;

public class Webtoon_StarDTO {
	private int idx;
	private String title;
	private int no;
	private int	m_idx;
	private int star;
	
	
	Webtoon_StarDTO(){	}


	public Webtoon_StarDTO(int idx, String title, int no, int m_idx, int star) {
		super();
		this.idx = idx;
		this.title = title;
		this.no = no;
		this.m_idx = m_idx;
		this.star = star;
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


	public int getM_idx() {
		return m_idx;
	}


	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}


	public int getStar() {
		return star;
	}


	public void setStar(int star) {
		this.star = star;
	}


	@Override
	public String toString() {
		return "Webtoon_StarDTO [idx=" + idx + ", title=" + title + ", no=" + no + ", m_idx=" + m_idx + ", star=" + star
				+ "]";
	}
	
	
}
