package com.poly.Service;

import java.util.List;

import com.poly.Entity.Share;
import com.poly.Entity.User;
import com.poly.Entity.Video;

public interface ShareService {
	List<Share> findByUser(String username);
	List<Share> findByUserIdAndVideoId(Integer userId, Integer videoId);
	Share findByUserIdAndVideoIdAndEmail(Integer userId, Integer videoId, String email);
	
	static Share create(User user, Video video, String email) {
		// TODO Auto-generated method stub
		return null;
	}
	Share update(Share share);
}
