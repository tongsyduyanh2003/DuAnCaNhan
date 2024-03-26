package com.poly.Dao;

import java.util.List;

import com.poly.Entity.Share;

public interface ShareDao {
	
	List<Share> findByUser(String username);
	List<Share> findByUserIdAndVideoId(Integer userId, Integer videoId);
	Share findByUserIdAndVideoIdAndEmail(Integer userId, Integer videoId, String email);
	Share create(Share share);
	Share update(Share share);
	
}
