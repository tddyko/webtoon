package com.example.webtoon.util.path;

import javax.servlet.http.HttpSession;

public class FilePath {

	public static String path(HttpSession session,String path){
		String result ="";
		
		result = session.getServletContext().getRealPath(path)+"/";
		
		return result;
	};
	
}
