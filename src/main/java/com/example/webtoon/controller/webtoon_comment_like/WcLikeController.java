package com.example.webtoon.controller.webtoon_comment_like;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.webtoon.service.webtoon_comment_like.WcLikeService;

@RestController
public class WcLikeController {

	@Inject
	WcLikeService service;

	@RequestMapping("/webtoon_comment_like/like.do")
	public int like(int c_idx, int m_idx) {

		if (c_idx == 0 && m_idx == 0) {

			return 0;
		} else {
			return service.wclUpdown(m_idx, c_idx);
		}

	}

}
