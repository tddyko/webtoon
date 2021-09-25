package com.example.webtoon.controller.adminWt_Episode;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.webtoon.model.webtoon_Episode.dto.Webtoon_EpisodeDTO;
import com.example.webtoon.service.webtoon_Episode.Webtoon_EpisodeService;
import com.example.webtoon.util.path.FilePath;

@Controller
public class Wt_EpisodeController {
	
	@Inject
	Webtoon_EpisodeService wt_epi_service;
	
	@RequestMapping("/adminPage/webtoonEpiSetting")
	public String webtoonEpiSetting(@RequestParam String title,Model model,HttpSession session) throws Exception{
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }

		title = URLDecoder.decode(title, "utf-8");
		model.addAttribute("wtE_title",title);
		List<Webtoon_EpisodeDTO> list = wt_epi_service.wtEpisodelist(title);
		model.addAttribute("wtEpisode",list);
		
		return "adminPage/wt_Episode_Setting/wt_EpisodeSeries";
	}
	
	@RequestMapping("/adminPage/wt_episodeInsert")
	public String wt_EpisodeInsert(@RequestParam String title,Model model,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		model.addAttribute("wt_title",title);
		return "adminPage/wt_Episode_Setting/wt_EpisodeInsert";
	}
	
	// 인서트확인
	@RequestMapping("/adminPage/wt_episodeInsert.do")
	public String wt_EpisodeInsertDo(@ModelAttribute Webtoon_EpisodeDTO dto,HttpSession session) throws Exception{
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }

		String title = URLEncoder.encode(dto.getTitle(),"utf-8");
		
		//웹툰 추가하기
		String filename="";
		filename=dto.getFile().getOriginalFilename();
		//dto에 이미지 이름 저장
		dto.setImage(filename);
		
		//파일 업로드
		String path = FilePath.path(session, "/WEB-INF/views/webtoons/"+dto.getTitle()+"/"+dto.getNo()+"/");
		
		try {
			// 존재하지않는 디렉토리인경우 생성
			new File(path).mkdir();
			dto.getFile().transferTo(new File(path+filename));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//인서트함
		wt_epi_service.wtEpisodeInsert(dto);
		
		return "redirect:/adminPage/webtoonEpiSetting?title="+ title;
	}
	
	@RequestMapping("/adminPage/wt_episodeUpdate")
	public String wt_episodeUpdate(@RequestParam int idx,Model model,HttpSession session){
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }

		
		Webtoon_EpisodeDTO dto = wt_epi_service.wtEpisodeUpdate(idx);
		model.addAttribute("wt_update",dto);
		return "adminPage/wt_Episode_Setting/wt_EpisodeUpdate";
	}
	
	// 업데이트확인
	@RequestMapping("/adminPage/wt_episodeUpdate.do")
	public String wt_episodeUpdateDo(@ModelAttribute Webtoon_EpisodeDTO dto,HttpSession session) throws Exception{
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }

		String title = URLEncoder.encode(dto.getTitle(),"utf-8");
		
		String filename="";
		
		//파일을 업로드 했다면
		if(!dto.getFile().isEmpty()){
			filename = dto.getFile().getOriginalFilename();
			
			String path = FilePath.path(session, "/WEB-INF/views/webtoons/"+dto.getTitle()+"/"+dto.getNo()+"/");
			try {
				// 디렉토리없으면 만듬
				new File(path).mkdir();
				dto.getFile().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else{
			//업로드를 안했을 경우
			Webtoon_EpisodeDTO dto2 = wt_epi_service.wtEpisodeUpdate(dto.getIdx());
			filename = dto2.getImage();
			System.out.println("파일이름"+filename);
		}
		dto.setImage(filename);
		
		//업데이트 인서트해주면됌.
		wt_epi_service.wtEpisodeUpdateDo(dto);
		
		
		return "redirect:/adminPage/webtoonEpiSetting?title="+ title;
	}
	@RequestMapping("/adminPage/wt_episodeDelete")
	public String wt_episodeDelete(@RequestParam int idx,HttpSession session) throws Exception{
		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }

		Webtoon_EpisodeDTO dto = wt_epi_service.wtEpisodeUpdate(idx);
		
		
		String filename = dto.getImage();
		String path = FilePath.path(session, "/WEB-INF/views/webtoons/"+dto.getTitle()+"/"+dto.getNo()+"/");
		File file = new File(path+filename);
		if(file.exists()){
			file.delete();
		}
		String path2 = FilePath.path(session, "/WEB-INF/views/webtoons/"+dto.getTitle()+"/");
		File file2 = new File(path2+dto.getNo());
		if(file2.exists()){
			file2.delete();
		}
		// 삭제함
		wt_epi_service.webtoonDelete(idx);
		
		String title = URLEncoder.encode(dto.getTitle(),"utf-8");
		return "redirect:/adminPage/webtoonEpiSetting?title="+ title;
	}
	
	
}
