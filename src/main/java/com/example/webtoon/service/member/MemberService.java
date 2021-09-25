package com.example.webtoon.service.member;

import java.util.List;
import java.util.Map;

import com.example.webtoon.model.member.dto.MemberDTO;

public interface MemberService {

	public void memberInsert(MemberDTO dto);
	public MemberDTO loginCheck(String email,String passwd);
	public boolean emailCheck(String email);
	public String idfind(String username,String phone);
	public boolean pwfind(String email, String phone);
	public void changePw(Map<String, String> map);
	public MemberDTO getPasswd();
	public void informationUpdate(Map<String, String> map);
	public List<MemberDTO> memberList();
    public void coinUp(int idx,int coin);
    public void coinSet(int idx,int coin);
    public int coinhave(int idx);
    public void coinDown(int idx,int coin);
}
