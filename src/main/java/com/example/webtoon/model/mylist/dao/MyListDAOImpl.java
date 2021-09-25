package com.example.webtoon.model.mylist.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.mylist.dto.MyListDTO;

@Repository
public class MyListDAOImpl implements MyListDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public int Check(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = sqlsession.selectOne("MyListCheck", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void buyWebtoon(Map<String, Object> map) {
		try {
			sqlsession.insert("buyWebtoon",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<MyListDTO> myList(int m_idx) {
		List<MyListDTO> list = null;
		try {
			list = sqlsession.selectList("myList", m_idx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
