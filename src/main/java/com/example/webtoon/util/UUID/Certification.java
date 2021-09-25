package com.example.webtoon.util.UUID;

import java.util.UUID;

public class Certification {

	public static String uuid(){
		String uuid = null;
		try {
			uuid= UUID.randomUUID().toString().substring(0,8);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return uuid;
	}

	
}
