package com.example.webtoon.model.freeboard_comment_reply.dao;

import java.util.List;

import com.example.webtoon.model.freeboard_comment_reply.dto.Fc_replyDTO;

public interface Fc_replyDAO {
	
	public int count(int fc_idx);
	public void fc_ReplyInsert(Fc_replyDTO dto);
	public List<Fc_replyDTO> fc_replyList(int fc_idx);
	public void fc_replyDelete(int idx);
	public void fc_replyDeleteAll(int idx);
}
