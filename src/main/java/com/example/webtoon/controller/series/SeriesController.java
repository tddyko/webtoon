package com.example.webtoon.controller.series;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;

import com.example.webtoon.model.member.dto.MemberDTO;
import com.example.webtoon.model.webtoon.dto.WebtoonDTO;
import com.example.webtoon.model.webtoon_Episode.dto.Webtoon_EpisodeDTO;
import com.example.webtoon.model.webtoon_image.dto.Webtoon_ImageDTO;
import com.example.webtoon.service.favorite_wt.Favorite_wtService;
import com.example.webtoon.service.member.MemberService;
import com.example.webtoon.service.mylist.MyListService;
import com.example.webtoon.service.webtoon.WebtoonService;
import com.example.webtoon.service.webtoon_Episode.Webtoon_EpisodeService;
import com.example.webtoon.service.webtoon_Image.Webtoon_ImageService;
import com.example.webtoon.service.webtoon_comment.Webtoon_commentService;
import com.example.webtoon.service.webtoon_star.Webtoon_StarService;
import com.example.webtoon.util.page.C_pageDAO;
import com.example.webtoon.util.page.w_pageDAO;

@Controller
public class SeriesController {

	@Inject
	WebtoonService service;

	@Inject
	Webtoon_EpisodeService serviceE;

	@Inject
	Webtoon_ImageService serviceI;
	@Inject
	Webtoon_commentService wc_service;

	@Inject
	Webtoon_StarService wt_starService;
	@Inject
	MyListService mylist_Service;
	@Inject
	MemberService member_Service;

	@Inject 
	Favorite_wtService favorite_wtservice;
	
	@RequestMapping("/series/weekly")
	public String weekly(Model model) {
		Date date = new Date();
		String dayOfTheWeek = date.toString().substring(0, 3);

		return "redirect:/series/weekly.do?week=" + dayOfTheWeek;
	}

	@RequestMapping("/series/weekly.do")
	public String weeklyDo(@RequestParam String week, Model model) {
		// WebtoonDTO dto = new WebtoonDTO();
		List<WebtoonDTO> items = service.weeklyList(week);
		model.addAttribute("series", items);
		model.addAttribute("week", week);
		return "/series/weekly";
	}

	@RequestMapping("/series/series_list.do")
	public String seriesList(@RequestParam String title, Model model) {
		// 해당 웹툰정보
		WebtoonDTO wt = service.webtoonInfo(title);
		model.addAttribute("webtoon", wt);
		
		// 웹툰 화
		List<Webtoon_EpisodeDTO> items = serviceE.seriesList(title);
		model.addAttribute("episode", items);
		
		return "/series/series_list";
	}
	
	//오늘집가서추가 관심웹툰
	
	@RequestMapping("/series/favorite_wt.do")
	public @ResponseBody int favorite_wt(@RequestParam String title, HttpSession session ,Model model){
		
		System.out.println(title);
				MemberDTO dto = null;
				try {
					dto = (MemberDTO) session.getAttribute("member");
				} catch (Exception e) {
					e.printStackTrace();
				}
				//로그인 첵
				if (dto == null) {
					return 3;
				}
				
				// 관심웹툰이였는지 확인
				int check =0;
				int idx= dto.getIdx();
				
				check = favorite_wtservice.favoriteCheck(title,idx);
				
				if(check!=0){
					//관심상품이였을 경우
					System.out.println("관심");
					return 2;
				}else if(check==0){
					//관심상품이아니였을경우
					System.out.println("관심아니야~등록할꺼야");
					favorite_wtservice.favoriteInsert(title, idx);
					return 1;
				}else {
					return 3;
				}
				
				
	}
	
	

	@RequestMapping("/series/webtoon_list.do")
	public String webtoonList(@RequestParam String title, @RequestParam int no, Model model, HttpSession session) {

		if (serviceE.freeCheck(title, no)) {
			int count = wc_service.count(title, no);
			C_pageDAO page = new C_pageDAO(count, 1);
			int totPage = page.getTotPage();

			List<Webtoon_ImageDTO> items = serviceI.webtoonList(title, no);
			count = serviceE.wtEpisodeCount(title, no);

			w_pageDAO r_page = new w_pageDAO(count, no);

			model.addAttribute("page", r_page);
			model.addAttribute("webtoon", items);
			model.addAttribute("totPage", totPage);
			model.addAttribute("title", title);
			model.addAttribute("no", no);
			return "/series/webtoon_list";
		} else {
			MemberDTO dto = null;

			try {
				dto = (MemberDTO) session.getAttribute("member");
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (dto == null) {
				return "redirect:/member/login";
			}

			if (mylist_Service.Check(dto.getIdx(), title, no)) {
				// 구매한 내역이 있다면
				int count = wc_service.count(title, no);
				C_pageDAO page = new C_pageDAO(count, 1);
				int totPage = page.getTotPage();

				List<Webtoon_ImageDTO> items = serviceI.webtoonList(title, no);
				count = serviceE.wtEpisodeCount(title, no);

				w_pageDAO r_page = new w_pageDAO(count, no);

				model.addAttribute("page", r_page);
				model.addAttribute("webtoon", items);
				model.addAttribute("totPage", totPage);
				model.addAttribute("title", title);
				model.addAttribute("no", no);
				return "/series/webtoon_list";
			} else {
				// 구매하지 않았다면
				if (member_Service.coinhave(dto.getIdx()) >= serviceE.wt_coin(title, no)) {
					// 해당 페이지로 리턴
					model.addAttribute("title", title);
					model.addAttribute("buy", serviceE.wt_coin(title, no));
					model.addAttribute("no", no);
					WebtoonDTO wt = service.webtoonInfo(title);
					model.addAttribute("webtoon", wt);
					List<Webtoon_EpisodeDTO> items = serviceE.seriesList(title);
					model.addAttribute("episode", items);
					return "/series/series_list";
				} else {
					return "redirect:/member/coupon.do";
				}
			}

		}

	}

	@RequestMapping("/series/buy_webtoon.do")
	public String buyWebtoon(@RequestParam String title, @RequestParam int no, Model model, HttpSession session) {

		MemberDTO dto = null;

		try {
			dto = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (dto == null) {

			return "redirect:/member/login";
		}
		if (mylist_Service.Check(dto.getIdx(), title, no)) {
			// 구매한 내역이 있다면
			int count = wc_service.count(title, no);
			C_pageDAO page = new C_pageDAO(count, 1);
			int totPage = page.getTotPage();

			List<Webtoon_ImageDTO> items = serviceI.webtoonList(title, no);
			count = serviceE.wtEpisodeCount(title, no);

			w_pageDAO r_page = new w_pageDAO(count, no);

			System.out.println(r_page);

			model.addAttribute("page", r_page);
			model.addAttribute("webtoon", items);
			model.addAttribute("totPage", totPage);
			model.addAttribute("title", title);
			model.addAttribute("no", no);
			return "/series/webtoon_list";
		} else {
			// 구매하지 않았다면
			if (member_Service.coinhave(dto.getIdx()) >= serviceE.wt_coin(title, no)) {
				mylist_Service.buyWebtoon(dto.getIdx(), title, no, serviceE.wt_coin(title, no));
				int count = wc_service.count(title, no);
				C_pageDAO page = new C_pageDAO(count, 1);
				int totPage = page.getTotPage();

				List<Webtoon_ImageDTO> items = serviceI.webtoonList(title, no);
				count = serviceE.wtEpisodeCount(title, no);

				w_pageDAO r_page = new w_pageDAO(count, no);

				model.addAttribute("page", r_page);
				model.addAttribute("webtoon", items);
				model.addAttribute("totPage", totPage);
				model.addAttribute("title", title);
				model.addAttribute("no", no);
				return "/series/webtoon_list";
			} else {
				return "redirect:/member/coupon.do";
			}
		}
	}

	// 별점추가함
	@RequestMapping("/series/star")
	public String webtoonStar(@RequestParam String title, @RequestParam int no, @RequestParam int idx,
			@RequestParam int star, Model model) {

		System.out.println("title=" + title + "no=" + no + "idx=" + idx + "star=" + star);
		// title,no값+member idx값으로 별점을 주엇는지 확인을 함
		int check = 0;
		check = wt_starService.wt_starCheck(title, no, idx);

		// 한적이없다면 insert함
		if (check == 0) {
			// 한적이없다면 insert함
			wt_starService.wt_starInsert(title, no, idx, star);
			model.addAttribute("check", "※별점을 주셔서 감사합니다.");
			// 평균값을 재설정함
			wt_starService.wt_starSetting(title, no);
			// 해당 웹툰 전체평점 설정
			wt_starService.wt_starSetting(title);

			// 페이지정보넘겨줌
			int count = wc_service.count(title, no);
			C_pageDAO page = new C_pageDAO(count, 1);
			int totPage = page.getTotPage();

			List<Webtoon_ImageDTO> items = serviceI.webtoonList(title, no);
			model.addAttribute("webtoon", items);
			model.addAttribute("totPage", totPage);

			// 추가함(휴일에)
			model.addAttribute("title", title);
			model.addAttribute("no", no);
			return "/series/webtoon_list";
		} else {
			// 한적이있다면 적용하지않습니다라고 전송
			model.addAttribute("check", "※이미 별점을 주셨습니다.");

			// 페이지 정보 넘겨줌
			int count = wc_service.count(title, no);
			C_pageDAO page = new C_pageDAO(count, 1);
			int totPage = page.getTotPage();

			List<Webtoon_ImageDTO> items = serviceI.webtoonList(title, no);
			model.addAttribute("webtoon", items);
			model.addAttribute("totPage", totPage);

			// 추가함(휴일에)
			model.addAttribute("title", title);
			model.addAttribute("no", no);

			return "/series/webtoon_list";

		}

	}

	// 검색후
	@RequestMapping("/webtoon/serch.do")
	public String webtoonSerch(@RequestParam String serch, Model model) {

		// 해당 제목웹툰정보
		System.out.println(serch + "서치");
		List<WebtoonDTO> list = service.webtoonSerch(serch);
		model.addAttribute("wt_list", list);
		return "/series/series_serch";
	}

}
