package com.example.webtoon.model.favorite_wt.dto;

import java.sql.Date;

public class Favorite_wtDTO {

	private int idx;
	private String w_title;
	private int m_idx;
	private Date plus_date;
	
	
	
	public Favorite_wtDTO() {
	}
	public Favorite_wtDTO(int idx, String w_title, int m_idx, Date plus_date) {
		super();
		this.idx = idx;
		this.w_title = w_title;
		this.m_idx = m_idx;
		this.plus_date = plus_date;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getW_title() {
		return w_title;
	}
	public void setW_title(String w_title) {
		this.w_title = w_title;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public Date getPlus_date() {
		return plus_date;
	}
	public void setPlus_date(Date plus_date) {
		this.plus_date = plus_date;
	}
	@Override
	public String toString() {
		return "FavoriteDTO [idx=" + idx + ", w_title=" + w_title + ", m_idx=" + m_idx + ", plus_date=" + plus_date
				+ "]";
	}
	
	
}
