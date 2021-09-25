package com.example.webtoon.model.coupon.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.webtoon.model.coupon.dto.CouponDTO;

@Repository
public class CouponDAOImpl implements CouponDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public void couponInsert(CouponDTO dto) {
		try {
			sqlsession.insert("couponInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<CouponDTO> couponList() {
		List<CouponDTO> list =null;
		try {
			list= sqlsession.selectList("couponList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int couponCheck(String coupon) {
		int result= 0;
		try {
			result=sqlsession.selectOne("couponCheck",coupon);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void couponDelete(int idx) {
	try {
		sqlsession.delete("couponDelete", idx);
	} catch (Exception e) {
		e.printStackTrace();
	}
		
	}

	@Override
	public void couponUpdate(CouponDTO dto) {
		try {
			sqlsession.update("couponUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public CouponDTO couponDTO(String coupon) {
		CouponDTO result = null;
		try {
			result = sqlsession.selectOne("couponDTO",coupon);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
