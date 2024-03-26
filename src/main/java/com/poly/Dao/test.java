package com.poly.Dao;

import java.util.List;

import com.poly.Dao.Implement.VideoDaoImpl;
import com.poly.Entity.Video;

public class test {
	public static void main(String[] args) {
		VideoDAO dao = new VideoDaoImpl();
		List<Video> listvideo = dao.findAll();
		for(Video video: listvideo) {
			System.out.println("id" + video.getId());
		}
	}
	
	
}
