package com.example.webtoon.controller.footer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonaldataController {
	@RequestMapping("/personaldata/personaldata.do")
	public String personaldataView(){
		return "footers/personaldata";
	}
}
