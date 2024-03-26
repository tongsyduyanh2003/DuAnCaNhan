package com.poly.Dao.Implement;

import java.util.List;

import com.poly.Dao.AbstractDao;
import com.poly.Dao.ShareDao;
import com.poly.Entity.Share;

public class ShareDaoImpl extends AbstractDao<Share> implements ShareDao {

	@Override
	public List<Share> findByUser(String username) {
		String sql = "SELECT o FROM Share o WHERE o.user.username = ?0 ORDER BY o.sharedDate DESC";
		return super.findMany(Share.class, sql, username);
	}

	@Override
	public List<Share> findByUserIdAndVideoId(Integer userId, Integer videoId) {
		String sql = "SELECT o FROM Share o WHERE o.user.id = ?0 AND o.video.id = ?1";
		return super.findMany(Share.class, sql, userId, videoId);
	}

	@Override
	public Share findByUserIdAndVideoIdAndEmail(Integer userId, Integer videoId, String email) {
		String sql = "SELECT o FROM Share o WHERE o.user.id = ?0 AND o.video.id = ?1 AND o.email = ?2";
		return super.findOne(Share.class, sql, userId, videoId, email);
	}

}
