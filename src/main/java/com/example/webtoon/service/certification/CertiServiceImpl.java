package com.example.webtoon.service.certification;

import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.webtoon.model.certification.dao.CertiDAO;
import com.example.webtoon.model.certification.dto.CertiDTO;
import com.example.webtoon.util.UUID.Certification;
import com.example.webtoon.util.mail.MailTest;

@Service
public class CertiServiceImpl implements CertiService {

	@Inject
	CertiDAO certidao;
	@Override
	public void insert(String email) {
		Map<String, String> map = new HashMap<String, String>();
		String uuid =Certification.uuid();
		map.put("uuid", uuid);
		map.put("email", email);
		try {
			certidao.insert(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			MailTest.sendEmail(email, "짭툰", "인증번호를 입력해주세요 인증번호는 "+uuid+" 입니다");
			Timer timer =new Timer();
			TimerTask task = new TimerTask() {
				
				@Override
				public void run() {
					delete(email);
					
				}
			};
			timer.schedule(task, 1000*60*5);
			//5분후 db값 삭제
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public boolean check(CertiDTO dto) {
		boolean result = false;
		int a=0;
		try {
			a = certidao.check(dto);
			result = a>0?true:false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public void delete(String email) {
		certidao.delete(email);
		
	}

}
