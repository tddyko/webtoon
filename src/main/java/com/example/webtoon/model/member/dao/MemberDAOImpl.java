package com.example.webtoon.model.member.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	SqlSession sqlsession;
	
	@Override
	public void memberInsert(MemberDTO dto) {
		try {
			
			sqlsession.insert("memberInsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public MemberDTO loginCheck(Map<String, String> map) {
		MemberDTO dto=null;
		try {
			dto=sqlsession.selectOne("loginCheck", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int emailCheck(String email) {
		int result=0;
		try{
			result=sqlsession.selectOne("emailCheck",email);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public String idfind(Map<String, String> map) {
		String result= "";
		try {
			result = sqlsession.selectOne("idfind",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int pwfind(Map<String, String> map) {
		int result = 0;
		try {
			result = sqlsession.selectOne("pwfind",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void changePw(Map<String, String> map) {
		try {
			sqlsession.update("changepw",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public MemberDTO getPasswd() {
		MemberDTO result = null;
		try {
			result = sqlsession.selectOne("getPasswd");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void informationUpdate(Map<String, String> map) {
		try {
			sqlsession.update("informationUpdate",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<MemberDTO> memberList() {
		List<MemberDTO> list =null;
		try {
			list=sqlsession.selectList("memberList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public void coinUp(Map<String, Object> map) {
	try {
		sqlsession.update("coinUp", map);
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	}

	@Override
	public void coinSet(Map<String, Object> map) {
		try {
			sqlsession.update("coinSet",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int coinhave(int idx) {
		int result = 0;
		
		try {
			result= sqlsession.selectOne("coinhave", idx);
		} catch (Exception e) {
		e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void coinDown(Map<String, Object> map) {
		try {
			sqlsession.update("coinDown", map);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

}
