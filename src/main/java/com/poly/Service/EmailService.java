package com.poly.Service;

import javax.servlet.ServletContext;

import com.poly.Entity.User;
import com.poly.Entity.Video;

public interface EmailService {
   void sendMail(ServletContext context,User recipient,String type);
   void sendShareEmail(ServletContext context, User sender, Video video, String email);
}
