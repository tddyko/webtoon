package com.example.webtoon.model.webtoon_comment_like.dto;

public class WcLikeDTO {

	private int idx;
	private int c_idx;
	private int m_idx;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	@Override
	public String toString() {
		return "WcLikeDTO [idx=" + idx + ", c_idx=" + c_idx + ", m_idx=" + m_idx + "]";
	}
	
	
	
}
