package com.example.webtoon.controller.freeboard_comment_reply;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.webtoon.model.freeboard_comment_reply.dto.Fc_replyDTO;
import com.example.webtoon.model.member.dto.MemberDTO;
import com.example.webtoon.service.freeboard_comment_reply.Fc_replyService;

@RestController
public class Fc_replyController {

	@Inject
	Fc_replyService service;

	@RequestMapping("/fc_relpy/list.do")
	public ModelAndView fc_relpyList(@RequestParam int fc_idx) {

		List<Fc_replyDTO> list = service.fc_replyList(fc_idx);

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("fc_idx", fc_idx);
		mav.setViewName("freeboard/freeboard_reply");
		return mav;
	}

	@RequestMapping("/fc_relpy/insert.do")
	public ModelAndView fc_replyInsert(@ModelAttribute Fc_replyDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		MemberDTO member = null;
		try {
			member = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (member == null) {
			mav.setViewName("/");
			// 에러페이지만들어서 넘겨야됨
			return mav;
		}
		// 에러없으면
		dto.setUsername(member.getUsername());
		dto.setEmail(member.getEmail());
		service.fc_ReplyInsert(dto);
		return null;
	};

	@RequestMapping("/fc_relpy/delete.do")
	public void fc_replyDelete(@RequestParam int idx) {

		service.fc_replyDelete(idx);
	}

}
