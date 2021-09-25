package com.example.webtoon.service.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.admin.dao.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Inject
	AdminDAO adminDao;
	
	@Override
	public int loginCheck(String adminID, String adminPW) {
		int check = 0;
		check = adminDao.loginCheck(adminID,adminPW);
		return check;
		
	}

}
