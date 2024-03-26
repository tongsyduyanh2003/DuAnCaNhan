package com.poly.Service;

import javax.servlet.ServletContext;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter.DEFAULT;

import com.poly.Entity.User;
import com.poly.Entity.Video;
import com.poly.Util.SendEmailUtils;
import com.poly.Util.SendEmailUtils;

public class EmailServiceImpl implements EmailService {
	private static final String EMAIL_WELCOME_SUBJECT = "Welcome to Beemodut App";
	private static final String EMAIL_FORGOT_PASSWORD = "Beemodut App - New Password";
	private static final String EMAIL_SHARE_VIDEOS = "Beemodut App - Another has just send the video to you!!!";
	@Override
	public void sendMail(ServletContext context, User recipient, String type) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		try {
			String content = null;
			String subject = null;
			switch (type) {
			case "welcome":
				subject = EMAIL_WELCOME_SUBJECT;
				content = "Dear " + recipient.getUsername() +"hope you have best time!!";
				break;
			case "forgot":
				subject = EMAIL_FORGOT_PASSWORD;
				content = "Dear " + recipient.getUsername() + ", your new password is here:" + recipient.getPassword();
				break;
			case "share":
				subject = EMAIL_SHARE_VIDEOS;
				content =  recipient.getUsername() + "has just send the video for you!";
				break;
			default:
				subject = "Beemodut Project";
				content = "This email is not exsist! Check it!!";
			}
			SendEmailUtils.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {	
			e.printStackTrace();
		}
	}
	@Override
	public void sendShareEmail(ServletContext context, User sender, Video video, String email) {
		String host = context.getInitParameter("host");
        String port = context.getInitParameter("port");
        String user = context.getInitParameter("user");
        String pass = context.getInitParameter("pass");
        
        try {
        	String subject = null;
        	String content = null;
        	
        	subject = EMAIL_SHARE_VIDEOS;
			content = sender.getUsername() + " has shared " + video.getTitle() + " to you. "
					+ "We hope you'll enjoy it. "
					+ "Link here: https://www.youtube.com/watch?v=" + video.getHref();
        	
        	SendEmailUtils.sendEmail(host, port, user, pass, email, subject, content);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
