package com.example.webtoon.controller.webtoon_comment_hate;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.webtoon.service.webtoon_comment_hate.WcHateService;

@RestController
public class WcHateController {

	@Inject
	WcHateService service;

	@RequestMapping("/webtoon_comment_hate/hate.do")
	public int like(int c_idx, int m_idx) {

		if (c_idx == 0 && m_idx == 0) {

			return 0;
		} else {
			return service.wchUpdown(m_idx, c_idx);
		}

	}
	
	
}
