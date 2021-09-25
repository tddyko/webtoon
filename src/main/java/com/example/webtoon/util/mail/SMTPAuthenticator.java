package com.example.webtoon.util.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	protected PasswordAuthentication getPasswordAuthentication() {
		  String username = "fakewebtoon@gmail.com"; // gmail 사용자;
		  String password = "faketoon1";  // 패스워드;
		  return new PasswordAuthentication(username, password);
		 }
		
}
