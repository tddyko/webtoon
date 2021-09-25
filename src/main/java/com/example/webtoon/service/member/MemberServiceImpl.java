package com.example.webtoon.service.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.member.dao.MemberDAO;
import com.example.webtoon.model.member.dto.MemberDTO;
import com.example.webtoon.util.mail.MailTest;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDAO;

	@Override
	public void memberInsert(MemberDTO dto) {
		
		try {
			memberDAO.memberInsert(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			MailTest.sendEmail(
					dto.getEmail(),
					"짭툰 회원가입을 축하드립니다", 
					"짭툰 회원 가입을 진심으로 축하해염");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public MemberDTO loginCheck(String email, String passwd) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("passwd", passwd);
		return memberDAO.loginCheck(map);
	}

	@Override
	public boolean emailCheck(String email) {
		if (memberDAO.emailCheck(email) == 0) {
			return true;
		} else
			return false;
	}

	@Override
	public String idfind(String username, String phone) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		map.put("phone", phone);
		return memberDAO.idfind(map);
	}

	@Override
	public boolean pwfind(String email, String phone) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("phone", phone);
		boolean result=false;
		result = memberDAO.pwfind(map)>0?true:false;
		return result;
	}

	@Override
	public void changePw(Map<String, String> map) {
		memberDAO.changePw(map);
	}

	@Override
	public MemberDTO getPasswd() {
		return memberDAO.getPasswd();
	}

	@Override
	public void informationUpdate(Map<String, String> map) {
		 memberDAO.informationUpdate(map);
	}

	@Override
	public List<MemberDTO> memberList() {
		// TODO Auto-generated method stub
		return memberDAO.memberList();
	}

	@Override
	public void coinUp(int idx, int coin) {
		Map<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("coin", coin);
		memberDAO.coinUp(map);
		
	}

	@Override
	public void coinSet(int idx, int coin) {
		Map<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("coin", coin);
		memberDAO.coinSet(map);
	}

	@Override
	public int coinhave(int idx) {
	
		return memberDAO.coinhave(idx);
	}

	@Override
	public void coinDown(int idx, int coin) {
		Map<String, Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("coin", coin);
		memberDAO.coinDown(map);
	}

}
