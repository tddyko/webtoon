package com.example.webtoon.model.certification.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.certification.dto.CertiDTO;

@Repository
public class CertiDAOImpl implements CertiDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public void insert(Map<String, String> map) {
		sqlsession.insert("certiInsert",map);
		
	}

	@Override
	public int check(CertiDTO dto) {
		int result =0;
		try {
			result=sqlsession.selectOne("certiCheck",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void delete(String email) {
		sqlsession.delete("certiDelete",email);
		
	}

	
}
