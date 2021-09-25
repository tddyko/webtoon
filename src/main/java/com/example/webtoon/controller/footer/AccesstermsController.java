package com.example.webtoon.controller.footer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AccesstermsController {
	/*@Inject
	AccesstermsDAO accesstermsDao;*/
	
	@RequestMapping("/accessterms/accessterms.do")
	public String accesstermsView(){

		return "footers/accessterms";
	}
}
