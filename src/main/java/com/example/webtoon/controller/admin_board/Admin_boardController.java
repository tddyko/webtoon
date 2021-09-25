package com.example.webtoon.controller.admin_board;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.webtoon.model.freeboard.dto.FreeboardDTO;
import com.example.webtoon.model.qnaboard.dto.QnaboardDTO;
import com.example.webtoon.model.ulboard.dto.UlboardDTO;
import com.example.webtoon.service.freeboard.FreeboardService;
import com.example.webtoon.service.qnaboard.QnaboardService;
import com.example.webtoon.service.ulboard.UlboardService;
import com.example.webtoon.util.page.PageDAO;
import com.example.webtoon.util.path.FilePath;

@Controller
public class Admin_boardController {

	@Inject
	QnaboardService qnaService;
	@Inject
	UlboardService ulService;
	@Inject
	FreeboardService freeSerivce;
	
	@RequestMapping("/adminPage/freeboard_search_title.do")
	public String freeboardSearchTitle(@RequestParam String search, Model model,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		List<FreeboardDTO> items = freeSerivce.freeboardSearchTitle(search);
		model.addAttribute("list",items);
		return "adminPage/freeboard/freeboard_list";
	}
	@RequestMapping("/adminPage/freeboard_search_email.do")
	public String freeboardSearchEmail(@RequestParam String search, Model model,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		List<FreeboardDTO> items = freeSerivce.freeboardSearchEmail(search);
		model.addAttribute("list",items);
		return "adminPage/freeboard/freeboard_list";
	}
	
	
	@RequestMapping("/adminPage/freeboard_list.do")
	public String freeboardList(@RequestParam(defaultValue = "1") int curPage,Model model,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		int count =freeSerivce.count();

		PageDAO pageDao = new PageDAO(count, curPage);

		int start = pageDao.getPageBegin();
		int end = pageDao.getPageEnd();

		// service 호출
		List<FreeboardDTO> items = freeSerivce.freeboardList(start, end);
		// 모델에 자료 저장
		model.addAttribute("list", items);
		model.addAttribute("page", pageDao);
		// board_list.jsp로 포워딩되어 출력됨
		
		return "adminPage/freeboard/freeboard_list";
	}
	
	@RequestMapping("/adminPage/freeboardDelete.do")
	public String freeboardDelete(int idx,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		freeSerivce.freeboardDelete(idx);
		return "redirect:/adminPage/freeboard_list.do";
	}
	
//	qnaboard
	
	@RequestMapping("/adminPage/qnaboard")
	public String qnaboardList(Model model,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		List<QnaboardDTO> items = qnaService.qnaboardList();
		model.addAttribute("items", items);
		return "adminPage/qnaboard/qnaboard_list";
	}
	
	
	@RequestMapping("/qnaboard/qnaboardInsert")
	public String qnaboardInsert(@ModelAttribute QnaboardDTO dto,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		return "adminPage/qnaboard/qnaboard_insert";
	}
	@RequestMapping("/qnaboard/qnaboardInsert.do")
	public String qnaboardInsertdo(@ModelAttribute QnaboardDTO dto,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
	qnaService.qnaboardInsert(dto);
		
		return "redirect:/adminPage/qnaboard";
	}
	
	@RequestMapping("/qnaboard/qnaboardDelete.do")
	public String qnaboardDelete(@RequestParam int idx,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		qnaService.qnaboardDelete(idx);
		return "redirect:/adminPage/qnaboard";
	}
	
	@RequestMapping("/qnaboard/qnaboardView.do")
	public String qnaboardView(Model model,@RequestParam int idx,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		QnaboardDTO items = qnaService.qnaboardView(idx);
	;
		model.addAttribute("view",items);
		return "adminPage/qnaboard/qnaboard_view";
	}
	
	@RequestMapping("/qnaboard/qnaboardUpdate.do")
	public String qnaboardUpdate(@ModelAttribute QnaboardDTO dto, Model model,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		qnaService.qnaboardUpdate(dto);
		return "redirect:/adminPage/qnaboard";
	}
	
	
//	qnaboard
	
//	ulboard
	@RequestMapping("/adminPage/ulboard_list.do")
	public String ulboard_list(@RequestParam(defaultValue="1") int curPage, Model model,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		int count = ulService.count();
		
		PageDAO pageDao = new PageDAO(count, curPage);
		
		int start = pageDao.getPageBegin();
		int end = pageDao.getPageEnd();
		
		List<UlboardDTO> items =  ulService.ulboardList(start, end);
		System.out.println(items);
		model.addAttribute("list", items);
		model.addAttribute("page", pageDao);
		
		return "adminPage/ulboard/ulboard_list";
	}
	
	
	@RequestMapping("/adminPage/ulboardDelete.do")
	public String ulboardDelete(@RequestParam int idx, HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		UlboardDTO dto = ulService.ulboardView(idx);
		
		String username = dto.getUsername();
		String filename = dto.getImg_url();
		String path = FilePath.path(session,"/WEB-INF/views/images/ulimg/"+username+"/");
		try {
			File file = new File(path + filename);
			if(file.exists()){
				file.delete();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ulService.ulboardDelete(idx);
		return "redirect:/adminPage/ulboard_list.do";
	}
	
	
	
//	ulboard
	
	
	
	
}
