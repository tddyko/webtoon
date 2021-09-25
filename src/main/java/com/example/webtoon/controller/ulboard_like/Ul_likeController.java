package com.example.webtoon.controller.ulboard_like;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.webtoon.service.ulboard_like.Ul_likeService;

@RestController
public class Ul_likeController {
	
	@Inject
	Ul_likeService service;

	@RequestMapping("/ul_like/like.do")
	public int like(int u_idx, int m_idx) {
		if (u_idx == 0 && m_idx == 0) {
			return 0;
		} else {
			return service.ul_likeUpdown(m_idx, u_idx);
		}

	}
	
}
