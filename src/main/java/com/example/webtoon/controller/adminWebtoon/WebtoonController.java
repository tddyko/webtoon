package com.example.webtoon.controller.adminWebtoon;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.webtoon.model.webtoon.dto.WebtoonDTO;
import com.example.webtoon.service.webtoon.WebtoonService;
import com.example.webtoon.util.path.FilePath;

@Controller
public class WebtoonController {
	
	@Inject
	WebtoonService webtoonService;
	
	@RequestMapping("adminPage/webtoonSetting")
	public String webtoonSetting(HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		Date date = new Date();
		String dayOfTheWeek = date.toString().substring(0, 3);

		return "redirect:/adminPage/webtoonSetting.do?week=" + dayOfTheWeek;
	}
	@RequestMapping("/adminPage/webtoonSetting.do")
	public String adminWeeklyDo(@RequestParam String week, Model model,HttpSession session) {
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		//WebtoonDTO dto = new WebtoonDTO();
			List<WebtoonDTO> items = webtoonService.ad_weeklyList(week);
			model.addAttribute("series",items);
			model.addAttribute("week",week);
			return  "adminPage/webtoonSetting/webtoonSeries";
	}
	
	// 웹툰 리스트 수정
	@RequestMapping("/adminPage/webtoonUpdate")
	public String adminUpdate(@RequestParam int idx,Model model,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		WebtoonDTO dto = webtoonService.webtoonUpdate(idx);
		model.addAttribute("webtoon",dto);
		return "adminPage/webtoonSetting/webtoonUpdate";
	}
	
	@RequestMapping("/adminPage/webtoonUpdate.do")
	public String adminUpdateDo(@ModelAttribute WebtoonDTO dto, HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		String filename="";
		
		//파일 업로드했다면
		if(!dto.getFile().isEmpty()){
			filename =dto.getFile().getOriginalFilename();
			String title = dto.getTitle();
			
			String path = FilePath.path(session,"/WEB-INF/views/webtoons/"+title+"/");
			try {
				new File(path).mkdir();
				dto.getFile().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			//업로드를 안했을 경우
			WebtoonDTO dto2 = webtoonService.webtoonUpdate(dto.getIdx());
			filename = dto2.getImage();
			// 원래 있던 파일을 넣음
		}
		String originalWeek = dto.getWeek();
		dto.setImage(filename);
		
		// 업데이트함
		webtoonService.webtoonUpdateConfrim(dto);
		return "redirect:/adminPage/webtoonSetting.do?week="+originalWeek;
	}
	
	@RequestMapping("/adminPage/webtoonDelete.do")
	public String webtoonDelete(@RequestParam int idx,@RequestParam String image, @RequestParam String week,@RequestParam String title,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		System.out.println(idx+image+week+title);
		
		//기존에 있던 파일삭제
		String filename = image;
		String path = FilePath.path(session, "/WEB-INF/views/webtoons/"+title+"/");
		File file = new File(path + filename);
		if(file.exists()){
			file.delete();
		}
		path = FilePath.path(session, "/WEB-INF/views/webtoons/");
		file = new File(path+title);
		if(file.exists()){
			file.delete();
		}
		//삭제함
		webtoonService.webtoonDelete(idx);
		
		return "redirect:/adminPage/webtoonSetting.do?week="+week;
	}
	
	@RequestMapping("/adminPage/webtoonInsert")
	public String webtoonInsert(@RequestParam String week,Model model,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		model.addAttribute("week",week);
		return "adminPage/webtoonSetting/webtoonInsert";
	}
	
	
	//웹툰 추가하기
	@RequestMapping("/adminPage/webtoonInsert.do")
	public String webtoonInsertDo(@ModelAttribute WebtoonDTO dto,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		String week= String.valueOf(dto.getWeek());
		
		//웹툰을 추가한다
		String filename="";
		filename=dto.getFile().getOriginalFilename();
		//dto에 이미지 이름 저장
		dto.setImage(filename);
		
		
		//파일 업로드
		String path = FilePath.path(session, "/WEB-INF/views/webtoons/"+dto.getTitle()+"/");
		try {
			// 존재하지않는 디렉토리인 경우 생성
			new File(path).mkdir();
			
			dto.getFile().transferTo(new File(path+filename));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//인서트할때 dto (idx값은 무시)
		//인서트함
		webtoonService.webtoonInsert(dto);
		
		// 임시 파일을 지정된 디렉토리로 저장
		return "redirect:/adminPage/webtoonSetting.do?week="+week;
	}
	
}
