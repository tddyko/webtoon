package com.example.webtoon.controller.admin_page;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.webtoon.model.coupon.dto.CouponDTO;
import com.example.webtoon.model.member.dto.MemberDTO;
import com.example.webtoon.service.coupon.CouponService;
import com.example.webtoon.service.member.MemberService;
import com.example.webtoon.util.UUID.Certification;
import com.example.webtoon.util.mail.MailTest;

@Controller
public class Admin_PageController {

	@Inject
	MemberService member_Service;
	@Inject
	CouponService coupon_Service;

	@RequestMapping("/adminPage/member_list.do")
	public String memberList(Model model,HttpSession session) {
		   String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		List<MemberDTO> memberList = member_Service.memberList();
		model.addAttribute("list", memberList);
		return "adminPage/member/memberList";
	}

	@RequestMapping("/adminPage/member_coin")
	public String coinUp(int idx, int coin,HttpSession session) {
		   String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		member_Service.coinSet(idx, coin);
		return "redirect:/adminPage/member_list.do";
	}

	@RequestMapping("/adminPage/email")
	public String email(Model model, String email,HttpSession session) {
		   String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		model.addAttribute("email", email);
		return "adminPage/member/email";
	}

	@RequestMapping("adminPage/email.do")
	public String sendEmail(String email, String content, String subject,HttpSession session) {
		   String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		String html = "<html><head><meta charset='utf-8'></head><body>" + content + "</body></html>";

		try {
			MailTest.sendEmail(email, subject, html);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:/adminPage/member_list.do";
	}

	@RequestMapping("adminPage/coupon_list.do")
	public String couponList(Model model,HttpSession session) {
		   String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		List<CouponDTO> list = coupon_Service.couponList();
		model.addAttribute("list", list);
		return "adminPage/coupon/couponList";

	}

	@RequestMapping("/adminPage/couponInsert")
	public String couponInsert(@ModelAttribute CouponDTO dto,HttpSession session) {
		   String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		dto.setCoupon(Certification.uuid() + Certification.uuid());
		coupon_Service.couponInsert(dto);
		return "redirect:/adminPage/coupon_list.do";
	}
	
	@RequestMapping("/adminPage/counponDelete.do")
	public String couponDelete(int idx,HttpSession session){
		   String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		coupon_Service.couponDelete(idx);
		return "redirect:/adminPage/coupon_list.do";
	}
	
	@RequestMapping("/adminPage/counpoUpdate.do")
	public String couponUpdate(@ModelAttribute CouponDTO dto,HttpSession session){
		   String admin ="";
		   try {
			admin = (String) session.getAttribute("adminInfo");
		} catch (Exception e) {
			// TODO: handle exception
		}
		   if (admin==null){
			   return "redirect:/adminPage/password";
		   }
		coupon_Service.couponUpdate(dto);
		return "redirect:/adminPage/coupon_list.do";
	}
	

}
