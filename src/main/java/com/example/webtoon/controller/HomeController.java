package com.example.webtoon.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.webtoon.model.main_advertising.dto.Main_AdvertisingDTO;
import com.example.webtoon.model.webtoon.dto.WebtoonDTO;
import com.example.webtoon.service.main_advertising.Main_AdvertisingService;
import com.example.webtoon.service.webtoon.WebtoonService;
//현재 클래스를 스프링 컨트롤러 빈으로 등록시킴
@Controller
public class HomeController {
// 웹프로젝트의 시작 페이지 설정
	@Inject
	Main_AdvertisingService main_AdvertisingService;
	
	@Inject
	WebtoonService wt_service;
	
	@RequestMapping("/")
	public String main(Model model){
		
		// 광고 리스트
		List<Main_AdvertisingDTO> ad_list = main_AdvertisingService.mainAdvertisingList();
		model.addAttribute("carousel",ad_list);

		
		
		// 인기순 리스트
		List<WebtoonDTO> wt_list = wt_service.wt_heartList();
		model.addAttribute("heartList",wt_list);
		
		// 장르별 인기차트 뽑아오기
		
		String action = "액션";
		String comic = "코믹";
		String school = "학교";
		String romance = "로맨스";
		String adult = "성인";
		String etc = "기타";
		
		
		List<WebtoonDTO> wt_action = wt_service.wt_category(action);
		List<WebtoonDTO> wt_comic = wt_service.wt_category(comic);
		List<WebtoonDTO> wt_school = wt_service.wt_category(school);
		List<WebtoonDTO> wt_romance = wt_service.wt_category(romance);
		List<WebtoonDTO> wt_adult = wt_service.wt_category(adult);
		List<WebtoonDTO> wt_etc = wt_service.wt_category(etc);
		
		model.addAttribute("wt_action",wt_action);
		model.addAttribute("wt_comic",wt_comic);
		model.addAttribute("wt_school",wt_school);
		model.addAttribute("wt_romance",wt_romance);
		model.addAttribute("wt_adult",wt_adult);
		model.addAttribute("wt_etc",wt_etc);
		
		
		return "main"; 
	} 
	
}




