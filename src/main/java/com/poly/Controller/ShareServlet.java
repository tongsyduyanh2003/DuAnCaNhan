package com.poly.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.Constant.SessionAtt;
import com.poly.Entity.Share;
import com.poly.Entity.User;
import com.poly.Entity.Video;
import com.poly.Service.EmailService;
import com.poly.Service.EmailServiceImpl;
import com.poly.Service.ShareService;
import com.poly.Service.VideoService;
import com.poly.Service.VideoServiceImpl;



@WebServlet("/share")
public class ShareServlet extends HttpServlet{
	private VideoService videoService = new VideoServiceImpl(); 
	private EmailService emailService = new EmailServiceImpl(); 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String path = req.getServletPath();
		String href = req.getParameter("id");
		
		if(path.contains("send")) {
			doGetShare(session, href, req, resp);
		}
		
		req.setAttribute("id", href);
		req.getRequestDispatcher("/views/user/share.jsp").forward(req, resp);
		
		
	}
	private void doGetShare(HttpSession session, String href, HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("application/json");
		User currentUser = (User) session.getAttribute(SessionAtt.CURRENT_USER);
		Video video = videoService.findByHref(href);
		String email = req.getParameter("email");
		

		if (currentUser == null) {
			resp.sendRedirect("http://localhost:8080/Asm-Java4/login");
		} else {
			if (!email.isEmpty()) {
				Share share = ShareService.create(currentUser, video, email);

				if (share != null) {
					// Thành công nhưng không trả về Data
					emailService.sendShareEmail(getServletContext(), currentUser, video, email);
					resp.setStatus(204);
				} else {
					resp.setStatus(400);
				}
			} else {
				resp.setStatus(400);
			}
		}

	}
}
