package com.example.webtoon.controller.ulboard;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.webtoon.model.member.dto.MemberDTO;
import com.example.webtoon.model.ulboard.dto.UlboardDTO;
import com.example.webtoon.service.ulboard.UlboardService;
import com.example.webtoon.util.page.PageDAO;
import com.example.webtoon.util.path.FilePath;

@Controller
public class UlboardController {
	
	@Inject
	UlboardService service;
	
	// 게시글 목록
	@RequestMapping("/ulboard/ulboard_list.do")
	public String ulboard_list(@RequestParam(defaultValue="1") int curPage, Model model){
		int count = service.count();
		
		PageDAO pageDao = new PageDAO(count, curPage);
		
		int start = pageDao.getPageBegin();
		int end = pageDao.getPageEnd();
		
		List<UlboardDTO> items = service.ulboardList(start, end);
		model.addAttribute("list", items);
		model.addAttribute("page", pageDao);
		
		return "ulboard/ulboard_list";
	}
	
	// 게시글 쓰기버튼
	@RequestMapping("/ulboard/ulboardInsert")
	public String ulboardInsert(){
		return "ulboard/ulboardInsert";
	}
	
	// 게시글 쓰기 확인버튼
	@RequestMapping("/ulboard/ulboardInsert.do")
	public String ulboardInsertdo(@ModelAttribute UlboardDTO dto, HttpSession session){
		if(dto.getTitle() == null){
			return "/ulboard/ulboardInsert";
		} else {
			String filename = dto.getImgfile().getOriginalFilename();
			if(!dto.getImgfile().isEmpty()){
				MemberDTO member=(MemberDTO)session.getAttribute("member");
				String username = member.getUsername();
				String path = FilePath.path(session,"/WEB-INF/views/images/ulimg/"+username+File.separator);
			try {
				new File(path).mkdir();
				dto.getImgfile().transferTo(new File(path + filename));
			} catch (Exception e) {
			e.printStackTrace();
			}
			}
			dto.setImg_url(filename);
		}
		service.ulboardInsert(dto);
		return "redirect:/ulboard/ulboard_list.do";
	}
	
	// 게시글 보기
	@RequestMapping("/ulboard/ulboardView.do")
	public String ulboardView(Model model, @RequestParam int idx){
		service.hitUp(idx);
		UlboardDTO items = service.ulboardView(idx);
		model.addAttribute("view", items);
		return "ulboard/ulboardView";
	}
	
	// 게시글 수정버튼
	@RequestMapping("/ulboard/ulboardUpdate")
	public String ulboardUpdate(Model model, @RequestParam int idx){
		UlboardDTO items = service.ulboardView(idx);
		model.addAttribute("view", items);
		return "ulboard/ulboardUpdate";
	}
	
	// 게시글 수정 확인버튼
	@RequestMapping("/ulboard/ulboardUpdate.do")
	public String ulboardUpdatedo(@ModelAttribute UlboardDTO dto, @RequestParam int idx, @RequestParam String content, HttpSession session){
		String filename = dto.getImgfile().getOriginalFilename();
		if(!dto.getImgfile().isEmpty()){
			MemberDTO member=(MemberDTO)session.getAttribute("member");
			String username = member.getUsername();
			String path = FilePath.path(session,"/WEB-INF/views/images/ulimg/"+username+"/");
			try {
				new File(path).mkdir();
				dto.getImgfile().transferTo(new File(path + filename));
			} catch (Exception e) {
			e.printStackTrace();
			}
		} else {
			UlboardDTO dto2 = service.ulboardView(dto.getIdx());
			filename = dto2.getImg_url();
		}
		dto.setImg_url(filename);
		service.ulboardUpdate(dto);
		return "redirect:/ulboard/ulboardView.do?idx=" + idx;
	}
	
	// 게시글 삭제
	@RequestMapping("/ulboard/ulboardDelete.do")
	public String ulboardDelete(Model model, @RequestParam int idx, HttpSession session){
		String filename = service.ulimg(idx);
		MemberDTO member=(MemberDTO)session.getAttribute("member");
		String username = member.getUsername();
		String path = FilePath.path(session,"/WEB-INF/views/images/ulimg/"+username+"/");
		try {
			File file = new File(path + filename);
			if(file.exists()){
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		service.ulboardDelete(idx);
		return "redirect:/ulboard/ulboard_list.do";
	}
}