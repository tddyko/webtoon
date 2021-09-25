package com.example.webtoon.controller.freeboard_comment;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.webtoon.model.freeboard_comment.dto.FcDTO;
import com.example.webtoon.model.member.dto.MemberDTO;
import com.example.webtoon.service.favorite_wt.Favorite_wtService;
import com.example.webtoon.service.freeboard_comment.FcService;
import com.example.webtoon.util.page.C_pageDAO;

@RestController
public class Fc_Controller {

	@Inject
	FcService service;
	
	@RequestMapping("/freeboard_comment/totPage.do")
	public int totPage(int freeboard_idx){
		int totPage = 0;
		int count = service.count(freeboard_idx);
		C_pageDAO page =new C_pageDAO(count, 1);
		totPage= page.getTotPage();
		return totPage;
		
	}
	
	@RequestMapping("/freeboard_comment/insert.do")
	public ModelAndView fcInsert(@ModelAttribute FcDTO dto,HttpSession session){
		ModelAndView mav = new ModelAndView();
		MemberDTO member = null;
		try {
			member  = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (member==null) {
			mav.setViewName("/");
			//에러페이지만들어서 넘겨야됨
			return mav;
		}
		//에러없으면 
		dto.setUsername(member.getUsername());
		dto.setEmail(member.getEmail());
		service.fcInsert(dto);
		return null;
	};
	
	
	@RequestMapping("/freeboard_comment/list.do")
	public ModelAndView fcList(@RequestParam(defaultValue="1") int curPage,@RequestParam int freeboard_idx){

		ModelAndView mav = new ModelAndView();
		int count = service.count(freeboard_idx);
		C_pageDAO page =new C_pageDAO(count, curPage);
		int start = page.getPageBegin();
		int end = page.getPageEnd();

		List<FcDTO> items = service.fcList(start, end, freeboard_idx);
		mav.addObject("list", items);
		mav.addObject("page", page);
		mav.setViewName("freeboard/freeboard_comment");


		
		return mav;
	}
	
	@RequestMapping("/freeboard_comment/delete.do")
	public void fcDelete(int idx){
		service.fcDelete(idx);
	}
	
	

	
	
	
}
