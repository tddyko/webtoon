package com.example.webtoon.service.qnaboard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.qnaboard.dao.QnaboardDAO;
import com.example.webtoon.model.qnaboard.dto.QnaboardDTO;

@Service
public class QnaboardServiceImpl implements QnaboardService{

	@Inject QnaboardDAO qnaboardDao;
	
	@Override
	public List<QnaboardDTO> qnaboardList() {
		return qnaboardDao.qnaboardList();
	}

	@Override
	public void qnaboardInsert(QnaboardDTO dto) {
		qnaboardDao.qnaboardInsert(dto);
	}

	@Override
	public void qnaboardDelete(int idx) {
		qnaboardDao.qnaboardDelete(idx);
	}

	@Override
	public QnaboardDTO qnaboardView(int idx) {
		return qnaboardDao.qnaboardView(idx);
	}

	@Override
	public void qnaboardUpdate(QnaboardDTO dto) {
		qnaboardDao.qnaboardUpdate(dto);
	}


}
