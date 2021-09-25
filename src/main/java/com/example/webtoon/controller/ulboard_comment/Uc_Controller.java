package com.example.webtoon.controller.ulboard_comment;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.webtoon.model.member.dto.MemberDTO;
import com.example.webtoon.model.ulboard_comment.dto.UcDTO;
import com.example.webtoon.service.ulboard_comment.UcService;
import com.example.webtoon.util.page.C_pageDAO;

@RestController
public class Uc_Controller {

	@Inject
	UcService service;

	@RequestMapping("/ulboard_comment/insert.do")
	public ModelAndView UcInsert(@ModelAttribute UcDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberDTO member = null;
		try {
			member = (MemberDTO) session.getAttribute("member");

		} catch (Exception e) {
			e.printStackTrace();
		}
		if (member == null) {
			mav.setViewName("/");
			return mav;
		}
		dto.setUsername(member.getUsername());
		dto.setEmail(member.getEmail());
		service.ucInsert(dto);
		return null;
	}

	@RequestMapping("/ulboard_comment/list.do")
	public ModelAndView fcList(@RequestParam(defaultValue = "1") int curPage, @RequestParam int ulboard_idx){

		ModelAndView mav = new ModelAndView();
		int count = service.count(ulboard_idx);
		C_pageDAO page = new C_pageDAO(count, curPage);
		int start = page.getPageBegin();
		int end = page.getPageEnd();

		List<UcDTO> items = service.ucList(start, end, ulboard_idx);
		mav.addObject("list", items);
		mav.addObject("page", page);
		mav.setViewName("ulboard/ulboard_comment");
		return mav;
	}
	
	@RequestMapping("/ulboard_comment/totPage.do")
	public int totPage(int ulboard_idx){
		int totPage = 0;
		int count = service.count(ulboard_idx);
		C_pageDAO page =new C_pageDAO(count, 1);
		totPage= page.getTotPage();
		return totPage;
	}
	
	@RequestMapping("/ulboard_comment/delete.do")
	public void ucDelete(int idx){
		service.ucDelete(idx);
	}
}
