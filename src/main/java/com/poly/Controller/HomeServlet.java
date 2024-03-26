package com.poly.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.poly.Constant.SessionAtt;
import com.poly.Entity.History;
import com.poly.Entity.User;
import com.poly.Entity.Video;
import com.poly.Service.HistoryService;
import com.poly.Service.HistoryServiceImpl;
import com.poly.Service.VideoService;
import com.poly.Service.VideoServiceImpl;

@WebServlet(urlPatterns = { "/index", "/favorites", "/history" })
public class HomeServlet extends HttpServlet {
	public static final int VIDEO_MAX_PAGE_SIZE = 4;
	private static final long serialVersionUID = 1L;
	private VideoService videoService = new VideoServiceImpl(); // Inject IoC
	private HistoryService historyService = new HistoryServiceImpl();

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		// DoGet tong de? lay path cua tung DoGet theo case
		String path = req.getServletPath(); // localhost/Asm-Java4/login - Path re nhanh phia sau ten Project
		switch (path) {
		case "/index":
			doGetIndex(req, res);
			break;
		case "/favorites":
			doGetFavorites(session, req, res);
			break;
		case "/history":
			doGetHistory(session, req, res);
			break;
		}

	}

	private void doGetIndex(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// Chia page
		List<Video> countVideo = videoService.findAll();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) VIDEO_MAX_PAGE_SIZE);
		req.setAttribute("maxPage", maxPage);
		// For example:
		// 10 video , muon chia 1 trang co 4 video >>> 10/4 thi 2.5 trang => 3 TRANG
		List<Video> videos;
		String pageNumber = req.getParameter("page");
		if (pageNumber == null ||  Integer.valueOf(pageNumber) > maxPage ) {
			//Return to Page 1 neu ma Page rong or tham so truyen cua page > maxPage trong List 
			videos = videoService.findAll(1, VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage", 1);
		} else {
			videos = videoService.findAll(Integer.valueOf(pageNumber), VIDEO_MAX_PAGE_SIZE);
			req.setAttribute("currentPage",Integer.valueOf(pageNumber));
		}

		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/index.jsp");
		requestDispatcher.forward(req, res);
	}

	private void doGetFavorites(HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		User user = (User) session.getAttribute(SessionAtt.CURRENT_USER); // Check da login
		List<History> histories = historyService.findByUserAndIsLiked(user.getUsername()); // Kiem
		List<Video> videos = new ArrayList<>();
		histories.forEach(item -> videos.add(item.getVideo())); // Java8 forEach
		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/favorites.jsp");
		requestDispatcher.forward(req, res);
	}

	private void doGetHistory(HttpSession session, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		User user = (User) session.getAttribute(SessionAtt.CURRENT_USER); // Check da login
		List<History> histories = historyService.findByUser(user.getUsername()); // Kiem
		List<Video> videos = new ArrayList<>();
		histories.forEach(item -> videos.add(item.getVideo())); // Java8 forEach
		req.setAttribute("videos", videos);
		RequestDispatcher requestDispatcher = req.getRequestDispatcher("/views/user/history.jsp");
		requestDispatcher.forward(req, res);
	}
}
