package com.example.webtoon.controller.finishNnew;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.webtoon.model.webtoon.dto.WebtoonDTO;
import com.example.webtoon.service.webtoon.WebtoonService;

@Controller
public class finishNnewController {

	@Inject
	WebtoonService service;

	
	// 완결페이지
	@RequestMapping("/finishWebtoon/finishWebtoon")
	public String finishWebtoonList(Model model) {

		List<WebtoonDTO> list = service.wt_finishList("Y");
		model.addAttribute("finish",list);
		return "finish_new_wt/finish_list";

	}
	
	
	//신작 페이지
	@RequestMapping("/newWebtoon/newWebtoon")
	public String newWebtoonList(Model model){
		
		List<WebtoonDTO> list =service.wt_newList();
		
		model.addAttribute("newList",list);
		return "finish_new_wt/new_list";
	}
	
	@RequestMapping("/topWebtoon/tooWebtoon")
	public String topWebtoonList(Model model){
		
		List<WebtoonDTO> list =service.wt_topList();
		model.addAttribute("topList",list);
		return "finish_new_wt/top_list";
	}
	
	
}
