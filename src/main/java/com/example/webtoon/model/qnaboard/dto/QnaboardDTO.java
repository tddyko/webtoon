package com.example.webtoon.model.qnaboard.dto;

public class QnaboardDTO {
	private int idx;
	private String category;
	private String question;
	private String answer;
	
	public QnaboardDTO() {
		// TODO Auto-generated constructor stub
	}

	public QnaboardDTO(int idx, String category,String question, String answer) {
		this.idx = idx;
		this.category = category;
		this.question = question;
		this.answer = answer;
	}

	
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "QnaboardDTO [idx=" + idx + ", question=" + question + ", answer=" + answer + "]";
	}
	
	
}
