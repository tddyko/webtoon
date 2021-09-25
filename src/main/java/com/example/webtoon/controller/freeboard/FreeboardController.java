package com.example.webtoon.controller.freeboard;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.webtoon.model.freeboard.dto.FreeboardDTO;
import com.example.webtoon.model.member.dto.MemberDTO;
import com.example.webtoon.service.freeboard.FreeboardService;
import com.example.webtoon.service.freeboard_comment.FcService;
import com.example.webtoon.util.page.C_pageDAO;
import com.example.webtoon.util.page.PageDAO;

@Controller
public class FreeboardController {

	@Inject
	FreeboardService serivce;
	@Inject
	FcService fcservice;

	@RequestMapping("/freeboard/freeboard_list.do")
	public String freeboard_list(@RequestParam(defaultValue = "1") int curPage, Model model) {
		// 전체 페이지 번호가 curPage에 전달됨
		// 페이지 나누기 관련 정보 설정

		int count = serivce.count();

		PageDAO pageDao = new PageDAO(count, curPage);

		int start = pageDao.getPageBegin();
		int end = pageDao.getPageEnd();

		// service 호출
		List<FreeboardDTO> items = serivce.freeboardList(start, end);
		// 모델에 자료 저장
		model.addAttribute("list", items);
		model.addAttribute("page", pageDao);
		// board_list.jsp로 포워딩되어 출력됨

		return "freeboard/freeboard_list";
	}

	@RequestMapping("/freeboard/freeboardInsert")
	public String freeboardInsert(HttpSession session) {

		if ((MemberDTO) session.getAttribute("member") == null) {
			return "redirect:/member/login";
		} else {
			return "freeboard/freeboardInsert";
		}
	}

	@RequestMapping("/freeboard/freeboardInsert.do")
	public String freeboardInsertdo(@ModelAttribute FreeboardDTO dto) {
		serivce.freeboardInsert(dto);

		return "redirect:/freeboard/freeboard_list.do";
	}

	@RequestMapping("/freeboard/freeboardView.do")
	public String freeboardView(Model model, @RequestParam int idx) {
		serivce.hitUp(idx);
		FreeboardDTO items = serivce.freeboardView(idx);
		int freeboard_idx = idx;

		int count = fcservice.count(freeboard_idx);
		C_pageDAO page = new C_pageDAO(count, 1);

		model.addAttribute("view", items);
		model.addAttribute("totPage", page.getTotPage());
		return "freeboard/freeboardView";
	}

	// 게시판 수정하기
	@RequestMapping("/freeboard/freeboardUpdate")
	public String freeboardUpdate(Model model, @RequestParam int idx, HttpSession session) {
		FreeboardDTO items = serivce.freeboardView(idx);
		MemberDTO dto = null;
		try {
			dto = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (dto == null) {
			return "redirect:/member/login";
		}
	
		if (dto.getEmail().equals(items.getEmail())) {
			model.addAttribute("view", items);
			return "freeboard/freeboardUpdate";
		} else {
			session.invalidate();
			return "redirect:/member/login";
		}

	}

	// 게시판 수정확인
	@RequestMapping("/freeboard/freeboardUpdate.do")
	public String freeboardUpdateDo(@RequestParam int idx, @RequestParam String content) {
		serivce.freeboardUpdate(idx, content);
		return "redirect:/freeboard/freeboardView.do?idx=" + idx;
	}

	// 게시판 삭제하기
	@RequestMapping("/freeboard/freeboardDelete.do")
	public String freeboardDelete(@RequestParam int idx) {
		serivce.freeboardDelete(idx);
		return "redirect:/freeboard/freeboard_list.do";

	}
	
	@RequestMapping("/freeboard/freeboard_search_title.do")
	public String freeboardSearchTitle(@RequestParam String search, Model model){
		List<FreeboardDTO> items = serivce.freeboardSearchTitle(search);
		model.addAttribute("list",items);
		return "freeboard/freeboard_list";
	}
	@RequestMapping("/freeboard/freeboard_search_email.do")
	public String freeboardSearchEmail(@RequestParam String search, Model model){
		List<FreeboardDTO> items = serivce.freeboardSearchEmail(search);
		model.addAttribute("list",items);
		return "freeboard/freeboard_list";
	}
	
	

}
