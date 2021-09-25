package com.example.webtoon.controller.qnaboard;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.webtoon.model.qnaboard.dto.QnaboardDTO;
import com.example.webtoon.service.qnaboard.QnaboardService;

@Controller
public class QnaboardController {
	
	@Inject
	QnaboardService qnaService;

	@RequestMapping("/qnaboard/qnaboard_list.do")
	public String qnaboard_list(Model model){
		List<QnaboardDTO> items = qnaService.qnaboardList();
		model.addAttribute("items", items);
		return "qnaboard/qnaboard_list";
	}

}
