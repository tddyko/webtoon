package com.example.webtoon.service.qnaboard;

import java.util.List;

import com.example.webtoon.model.qnaboard.dto.QnaboardDTO;

public interface QnaboardService {

	public List<QnaboardDTO> qnaboardList();

	public void qnaboardInsert(QnaboardDTO dto);

	public void qnaboardDelete(int idx);

	public QnaboardDTO qnaboardView(int idx);

	public void qnaboardUpdate(QnaboardDTO dto);

}
