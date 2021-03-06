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
		// ?????? ????????????
		WebtoonDTO wt = service.webtoonInfo(title);
		model.addAttribute("webtoon", wt);
		
		// ?????? ???
		List<Webtoon_EpisodeDTO> items = serviceE.seriesList(title);
		model.addAttribute("episode", items);
		
		return "/series/series_list";
	}
	
	//????????????????????? ????????????
	
	@RequestMapping("/series/favorite_wt.do")
	public @ResponseBody int favorite_wt(@RequestParam String title, HttpSession session ,Model model){
		
		System.out.println(title);
				MemberDTO dto = null;
				try {
					dto = (MemberDTO) session.getAttribute("member");
				} catch (Exception e) {
					e.printStackTrace();
				}
				//????????? ???
				if (dto == null) {
					return 3;
				}
				
				// ???????????????????????? ??????
				int check =0;
				int idx= dto.getIdx();
				
				check = favorite_wtservice.favoriteCheck(title,idx);
				
				if(check!=0){
					//????????????????????? ??????
					System.out.println("??????");
					return 2;
				}else if(check==0){
					//?????????????????????????????????
					System.out.println("???????????????~???????????????");
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
				// ????????? ????????? ?????????
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
				// ???????????? ????????????
				if (member_Service.coinhave(dto.getIdx()) >= serviceE.wt_coin(title, no)) {
					// ?????? ???????????? ??????
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
			// ????????? ????????? ?????????
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
			// ???????????? ????????????
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

	// ???????????????
	@RequestMapping("/series/star")
	public String webtoonStar(@RequestParam String title, @RequestParam int no, @RequestParam int idx,
			@RequestParam int star, Model model) {

		System.out.println("title=" + title + "no=" + no + "idx=" + idx + "star=" + star);
		// title,no???+member idx????????? ????????? ???????????? ????????? ???
		int check = 0;
		check = wt_starService.wt_starCheck(title, no, idx);

		// ?????????????????? insert???
		if (check == 0) {
			// ?????????????????? insert???
			wt_starService.wt_starInsert(title, no, idx, star);
			model.addAttribute("check", "???????????? ????????? ???????????????.");
			// ???????????? ????????????
			wt_starService.wt_starSetting(title, no);
			// ?????? ?????? ???????????? ??????
			wt_starService.wt_starSetting(title);

			// ????????????????????????
			int count = wc_service.count(title, no);
			C_pageDAO page = new C_pageDAO(count, 1);
			int totPage = page.getTotPage();

			List<Webtoon_ImageDTO> items = serviceI.webtoonList(title, no);
			model.addAttribute("webtoon", items);
			model.addAttribute("totPage", totPage);

			// ?????????(?????????)
			model.addAttribute("title", title);
			model.addAttribute("no", no);
			return "/series/webtoon_list";
		} else {
			// ?????????????????? ?????????????????????????????? ??????
			model.addAttribute("check", "????????? ????????? ???????????????.");

			// ????????? ?????? ?????????
			int count = wc_service.count(title, no);
			C_pageDAO page = new C_pageDAO(count, 1);
			int totPage = page.getTotPage();

			List<Webtoon_ImageDTO> items = serviceI.webtoonList(title, no);
			model.addAttribute("webtoon", items);
			model.addAttribute("totPage", totPage);

			// ?????????(?????????)
			model.addAttribute("title", title);
			model.addAttribute("no", no);

			return "/series/webtoon_list";

		}

	}

	// ?????????
	@RequestMapping("/webtoon/serch.do")
	public String webtoonSerch(@RequestParam String serch, Model model) {

		// ?????? ??????????????????
		System.out.println(serch + "??????");
		List<WebtoonDTO> list = service.webtoonSerch(serch);
		model.addAttribute("wt_list", list);
		return "/series/series_serch";
	}

}
