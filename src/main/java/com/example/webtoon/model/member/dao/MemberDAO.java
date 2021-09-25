package com.example.webtoon.model.member.dao;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.member.dto.MemberDTO;

public interface MemberDAO {

	public void memberInsert(MemberDTO dto);
	public int emailCheck(String email);
	public MemberDTO loginCheck(Map<String, String> map);
	public String idfind(Map<String, String> map);
	public int pwfind(Map<String, String> map);
	public void changePw(Map<String, String> map);
	public MemberDTO getPasswd();
	public void informationUpdate(Map<String, String> map);
	public List<MemberDTO> memberList();
	public void coinUp(Map<String, Object> map);
	public void coinSet(Map<String, Object> map);
	public int coinhave(int idx);
	public void coinDown(Map<String, Object> map);
	
}
