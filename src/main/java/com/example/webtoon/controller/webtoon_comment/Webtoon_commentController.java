package com.example.webtoon.controller.webtoon_comment;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.webtoon.model.member.dto.MemberDTO;
import com.example.webtoon.model.webtoon_comment.dto.Webtoon_commentDTO;
import com.example.webtoon.service.webtoon_comment.Webtoon_commentService;
import com.example.webtoon.service.webtoon_comment_like.WcLikeService;
import com.example.webtoon.util.page.C_pageDAO;

@RestController
public class Webtoon_commentController {

	@Inject
	Webtoon_commentService service;
	@Inject
	WcLikeService wcl_Service;
	
	@RequestMapping("/webtoon_comment/totPage.do")
	public int totPage(String title,int no){
	int	totPage = 0;
	int count = service.count(title, no);
	C_pageDAO page =new C_pageDAO(count, 1);
	totPage= page.getTotPage();
	return totPage;
	}
	
	@RequestMapping("/webtoon_comment/list.do")
	public ModelAndView wcList(String title,int no,int curPage){

		int count = service.count(title, no);
		C_pageDAO page =new C_pageDAO(count, curPage);
		int start = page.getPageBegin();
		int end = page.getPageEnd();


		List<Webtoon_commentDTO> items= service.wcList(title, no, start, end);
		
		ModelAndView mav =new ModelAndView();
		mav.addObject("list", items);
		mav.addObject("page", page);
	
		mav.setViewName("series/webtoon_comment");
		
		return mav;
	}
	
	@RequestMapping("/webtoon_comment/insert.do")
	public ModelAndView fcInsert(@ModelAttribute Webtoon_commentDTO dto,HttpSession session){
	
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
		service.wcInsert(dto);

		return null;
	};
	
	@RequestMapping("/webtoon_comment/delete.do")
	public void wcdelete(int idx){
		service.wcDelete(idx);
	}
}
