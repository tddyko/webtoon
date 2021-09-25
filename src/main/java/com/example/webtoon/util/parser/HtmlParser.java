package com.example.webtoon.util.parser;

public class HtmlParser {

	   public static String convertHtmlchars(String content)  // 내용중 HTML 툭수기호인 문자를 HTML 특수기호 형식으로 변환


	    {
	        String convert = content;
	    
	        convert = convert.replaceAll("<", "&lt;");
	        convert = convert.replaceAll(">", "&gt;");
	        convert = convert.replaceAll("\n", "<br>");
	        convert = convert.replaceAll("  ", "&nbsp;&nbsp;");
	     
	        return convert;
	    }
	   
	
	
}
