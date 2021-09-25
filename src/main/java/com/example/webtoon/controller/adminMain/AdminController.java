package com.example.webtoon.controller.adminMain;

import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.webtoon.model.main_advertising.dto.Main_AdvertisingDTO;
import com.example.webtoon.model.webtoon.dto.WebtoonDTO;
import com.example.webtoon.service.admin.AdminService;
import com.example.webtoon.service.main_advertising.Main_AdvertisingService;
import com.example.webtoon.service.webtoon.WebtoonService;
import com.example.webtoon.util.path.FilePath;

@Controller
public class AdminController {

	@Inject
	Main_AdvertisingService main_AdvertisingService;

	@Inject
	AdminService adminService;

	@Inject
	WebtoonService wt_service;
	// 처음 메인화면 띄움
	@RequestMapping("/adminPage/password")
	public String adminPage(Model model) {
		List<Main_AdvertisingDTO> list = main_AdvertisingService.mainAdvertisingList();
		model.addAttribute("carousel", list);
		
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
		return "adminPage/adminMain";
	}

	@RequestMapping("/adminPage/adminMain.do")
	public String adminMain(Model model, HttpSession session, @RequestParam String adminID,
			@RequestParam String adminPW) {
		int check = 0;
		// 로그인체크
		check = adminService.loginCheck(adminID, adminPW);
		if (check == 0) {
			model.addAttribute("check", "관리자 정보가 아닙니다.");
		} else if (check == 1) {
			// 로그인되면 세션에 추가
			session.setAttribute("adminInfo", "admin");
		}
		// 원래있던 이미지 띄움
		List<Main_AdvertisingDTO> list = main_AdvertisingService.mainAdvertisingList();
		model.addAttribute("carousel", list);
		
		
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
		return "adminPage/adminMain";
		
		
	}

	@RequestMapping("/adminPage/CarouselUpdate.do")
	public String adminCarouselUpdate(Model model,HttpSession session) {
   String admin ="";
   try {
	admin = (String) session.getAttribute("adminInfo");
} catch (Exception e) {
	// TODO: handle exception
}
   if (admin==null){
	   return "redirect:/adminPage/password";
   }
		List<Main_AdvertisingDTO> list = main_AdvertisingService.mainAdvertisingListAll();
		model.addAttribute("carousel", list);
		return "adminPage/mainUpdate/carouselUpdate";
	}

	@RequestMapping("/adminPage/mainAdvertisingUpdate.do")
	public String mainAdvertisingUpdate(@RequestParam int idx, Model model,HttpSession session) {

		 String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		
		Main_AdvertisingDTO dto = main_AdvertisingService.mainAdvertisingUpdate(idx);
		model.addAttribute("carouselUpdate", dto);
		return "adminPage/mainUpdate/mainAdvertisingUpdate";
	}

	@RequestMapping("/adminPage/carouselUpdateConfirm.do")
	public String carouselUpdateConfirm(Model model, @ModelAttribute Main_AdvertisingDTO dto, HttpSession session) {
		String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }

		
		String filename = "";
		// 파일 업로드한 파일이 존재하면
		if (!dto.getFile().isEmpty()) {

			filename = main_AdvertisingService.mainImagename(dto.getIdx());
			String path = FilePath.path(session, "/WEB-INF/views/images/main_advertising/");
			File file = new File(path + filename);
			if (file.exists()) {
				file.delete();
			}

			filename = dto.getFile().getOriginalFilename();
			// /WEB-INF/view// 의실제경로
			try {
				// 존재하지 않는 디렉토리인 경우 생성
				new File(path).mkdir();
				// 임시 파일을 지정된 디렉토리로 이동
				dto.getFile().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			Main_AdvertisingDTO dto2 = main_AdvertisingService.mainAdvertisingUpdate(dto.getIdx());
			filename = dto2.getAd_image();
		}
		// 테이블에 이미지 파일 이름 저장
		dto.setAd_image(filename);
		// 업데이트요청
		main_AdvertisingService.main_ad_UpdateConfirm(dto);

		// 목록 띄워줌
		List<Main_AdvertisingDTO> list = main_AdvertisingService.mainAdvertisingListAll();
		model.addAttribute("carousel", list);
		return "adminPage/mainUpdate/carouselUpdate";
	}

	@RequestMapping("/adminPage/mainAdvertisingDelete.do")
	public String mainAdvertisingDelete(Model model, @RequestParam int idx, HttpSession session) {
		String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }

		
		
		String filename = main_AdvertisingService.mainImagename(idx);
		String path = FilePath.path(session, "/WEB-INF/views/images/main_advertising/");
		File file = new File(path + filename);
		if (file.exists()) {
			file.delete();
		}

		main_AdvertisingService.main_advertisingDelete(idx);
		List<Main_AdvertisingDTO> list = main_AdvertisingService.mainAdvertisingListAll();
		model.addAttribute("carousel", list);
		return "adminPage/mainUpdate/carouselUpdate";
	}

	@RequestMapping("/adminPage/mainAdvertisingInsert")
	public String mainAdvertisingInsert(HttpSession session) {
		   String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		return "adminPage/mainUpdate/mainAdvertisingInsert";
	}

	@RequestMapping("/adminPage/mainAdvertisingInsert.do")
	public String mainAdvertisingInsert(Model model, @ModelAttribute Main_AdvertisingDTO dto, HttpSession session) {
		String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		String filename = "";
		// 파일 업로드한 파일이 존재하면
		if (!dto.getFile().isEmpty()) {
			// 업로드한 파일의 이름
			filename = dto.getFile().getOriginalFilename();
			// /WEB-INF/view// 의실제경로
			String path = FilePath.path(session, "/WEB-INF/views/images/main_advertising/");
			try {
				// 존재하지 않는 디렉토리인 경우 생성
				new File(path).mkdir();
				// 임시 파일을 지정된 디렉토리로 이
				dto.getFile().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			// 업로드한 파일이 없으면
			Main_AdvertisingDTO dto2 = main_AdvertisingService.mainAdvertisingUpdate(dto.getIdx());
			filename = dto2.getAd_image();
		}
		// 테이블에 이미지 파일 이름 저장
		dto.setAd_image(filename);

		// 인서트함
		main_AdvertisingService.main_ad_Insert(dto);

		// 목록 띄워줌
		List<Main_AdvertisingDTO> list = main_AdvertisingService.mainAdvertisingListAll();
		model.addAttribute("carousel", list);
		return "adminPage/mainUpdate/carouselUpdate";
	}

}
