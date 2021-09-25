package com.example.webtoon.controller.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.webtoon.model.certification.dto.CertiDTO;
import com.example.webtoon.model.coupon.dto.CouponDTO;
import com.example.webtoon.model.favorite_wt.dto.Favorite_wtDTO;
import com.example.webtoon.model.member.dto.MemberDTO;
import com.example.webtoon.model.mylist.dto.MyListDTO;
import com.example.webtoon.service.certification.CertiService;
import com.example.webtoon.service.coupon.CouponService;
import com.example.webtoon.service.favorite_wt.Favorite_wtService;
import com.example.webtoon.service.member.MemberService;
import com.example.webtoon.service.mylist.MyListService;

@Controller
public class MemberController {

	@Inject
	MemberService memberService;
	@Inject
	CertiService certiService;
	@Inject
	CouponService couponSerivce;
	@Inject
	MyListService myListService;
	@Inject
	Favorite_wtService favorite_wtService;

	@RequestMapping("/member/coupon.do")
	public String coupon(HttpSession session) {
		MemberDTO dto = null;
		try {
			dto = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (dto == null) {
			return "member/login";
			// 오류페이지 넘겨야함
		}
		return "member/coupon";
	}

	@RequestMapping("/member/couponCheck")
	public String couponInsert(String coupon, HttpSession session, Model model) {
		MemberDTO dto = null;
		try {
			dto = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (dto == null) {
			return "member/login";
			// 오류페이지 넘겨야함
		}
		int idx = dto.getIdx();

		if (couponSerivce.couponCheck(coupon)) {
			// 해당 쿠폰있으면
			CouponDTO c_dto = couponSerivce.couponDTO(coupon);
			memberService.coinUp(idx, c_dto.getCoin());
			couponSerivce.couponDelete(c_dto.getIdx());
			model.addAttribute("ok", c_dto.getCoin()+"이 충전되었습니다");
			dto = memberService.loginCheck(dto.getEmail(), dto.getPasswd());
			session.setAttribute("member", dto);
			return "member/coupon";
		} else {
			model.addAttribute("no", "false");
			return "member/coupon";
		}
	}

	@RequestMapping("/member/findpw")
	public String findpw(String email, String phone2, Model model) {
		if (email == null || phone2 == null) {
			model.addAttribute("findpw", "false");
			return "member/find";
		}

		// 해당 이메일과 휴대폰번호가 일치했을때 비밀번호 변경하는 페이지로 이동
		if (memberService.pwfind(email, phone2)) {// 일치하면 (1이 리턴됨)
			model.addAttribute("email", email);
			return "member/find_pw";
		} else {// 이메일과 휴대폰 번호가 일치하지 않을때 (0이 리턴 됬을때)
			model.addAttribute("findpw", "false");
			return "member/find";
		}
	}

	@RequestMapping("/member/check")
	public String check(String email, Model model) {
		if (email == null) {
			return "member/check";
		}
		if (!memberService.emailCheck(email)) {
			model.addAttribute("message", "false");
			return "member/check";
		} else if (email.equals("") || email == null) {
			model.addAttribute("message", "false");
			return "member/check";
		} else {
			model.addAttribute("email", email);
			certiService.insert(email);
			return "member/certificationCheck";
		}

	}

	@RequestMapping("/member/sendnum")
	public String sendnum(String email, Model model) {
		if (email == null) {
			return "member/find_pw";
		} else {
			model.addAttribute("email", email);
			certiService.insert(email);
		}
		return "member/certification_find_pw";
	}

	@RequestMapping("/member/join")
	public String join(@ModelAttribute MemberDTO dto, Model model) {

		if (dto.getUsername() == null || dto.getPasswd() == null || dto.getPhone() == null) {
			model.addAttribute("email", dto.getEmail());
			return "member/join";
		}

		if ((dto.getEmail() != null && !dto.getEmail().equals(""))
				&& (dto.getPasswd() != null && !dto.getPasswd().equals(""))
				&& (dto.getPhone() != null && !dto.getPhone().equals(""))
				&& (dto.getUsername() != null && !dto.getUsername().equals(""))

		) {
			try {
				memberService.memberInsert(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/member/login";
		} else {
			model.addAttribute("email", dto.getEmail());
			model.addAttribute("message", "false");
			return "member/join";
		}

	}

	@RequestMapping("/member/login")
	public String login(String email, String passwd, HttpSession session, Model model) {
		if (email == null || passwd == null) {
			return "member/login";
		}
		System.out.println("email = " + email + " passwd = " + passwd);
		MemberDTO dto = memberService.loginCheck(email, passwd);
		if (dto == null) {
			model.addAttribute("message", "false");
			return "member/login";
		}
		System.err.println(dto);
		session.setAttribute("member", dto);
		session.setMaxInactiveInterval(1000 * 60 * 60);
		return "redirect:/";
	}

	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/member/find")
	public String find() {
		return "member/find";
	}

	@RequestMapping("/member/findemail")
	public String idfind(String username, String phone, Model model) {
		System.out.println("username=" + username);
		System.out.println("phone=" + phone);
		if (username == null || phone == null) {
			model.addAttribute("message", "false");
			System.out.println("널값");
			return "member/find";
		} else {
			System.out.println("찾아감");
			String email = "";
			email = memberService.idfind(username, phone);
			System.out.println(email);
			if (email == null) {
				model.addAttribute("message", "false");
				return "member/find";
			}
			model.addAttribute("email", email);

			return "member/find";
		}
	}

	@RequestMapping("/member/certi")
	public String certi(Model model, @ModelAttribute CertiDTO dto) {

		if (certiService.check(dto)) {
			model.addAttribute("email", dto.getEmail());
			return "member/join";
		} else {
			model.addAttribute("message", "false");
			model.addAttribute("email", dto.getEmail());
			return "member/certificationCheck";
		}
	}

	@RequestMapping("/member/changepw")
	public String changepw(String email, Model model) {
		model.addAttribute("email", email);
		return "member/changepw";
	}

	@RequestMapping("/member/changepw.do")
	public String changepwDo(String email, String passwd, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("passwd", passwd);
		memberService.changePw(map);
		return "member/login";
	}

	@RequestMapping("/member/information")
	public String information(Model model, HttpSession session) {
		MemberDTO dto = null;
		try {
			dto = (MemberDTO) session.getAttribute("member");
			model.addAttribute("member", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (dto == null) {
			return "member/login";
		}
		
		// 나의 구매웹툰
		int idx=dto.getIdx();
	
		List<MyListDTO> mylist = myListService.myList(idx);
		model.addAttribute("myList",mylist);
		
		dto = memberService.loginCheck(dto.getEmail(), dto.getPasswd());
		session.setAttribute("member", dto);
		return "member/information";
	}

	@RequestMapping("/member/information_update_pwinput")
	public String information_update_pwinput(Model model, HttpSession session) {
		MemberDTO member = null;
		try {
			member = (MemberDTO) session.getAttribute("member");
			model.addAttribute("member", member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (member == null) {
			return "member/login";
		}
		return "member/information_update_pwinput";
	}

	@RequestMapping("/member/information_update.do")
	public String information_update(HttpSession session, String passwd) {
		MemberDTO member = null;
		String sessionPasswd = "";
		// dto = memberService.mem
		try {
			member = (MemberDTO) session.getAttribute("member");
			sessionPasswd = member.getPasswd();
			if (!sessionPasswd.equals(passwd)) {
				return "member/information_update_fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/information_update";
	}

	@RequestMapping("/member/information_passwd_reinput")
	public String information_passwd_reinput() {
		return "member/information_update_pwinput";
	}

	@RequestMapping("/member/information_update_complete")
	public String information_update_complete(String username, String email, String phone, String passwd, String idx,
			Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("idx", idx);
		map.put("username", username);
		map.put("email", email);
		map.put("phone", phone);
		map.put("passwd", passwd);
		memberService.informationUpdate(map);
		return "member/login";
	}
	
	@RequestMapping("/member/favoriteDelete.do")
	public @ResponseBody void favoriteDelete(@RequestParam int idx){
		
		favorite_wtService.favoriteDelete(idx);
		
		
	}
	
	@RequestMapping("/member/favoriteList.do")
	public @ResponseBody ModelAndView favoriteList(HttpSession session){
	
		ModelAndView mav = new ModelAndView();
		MemberDTO member = null;
		try {
			member = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (member == null) {
			return null;
		}
	
		
	int idx =member.getIdx();
		// 나의 관심웹툰
		List<Favorite_wtDTO> favoriteList = favorite_wtService.favorite_wtList(idx);
		mav.addObject("favorList",favoriteList);
		mav.setViewName("member/favoriteList");
	
		return mav;
		
	}

}
