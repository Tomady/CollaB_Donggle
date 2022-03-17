package co.Donggle.CollaB.recent.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("RecentDao")
public class RecentServiceImpl implements RecentService {
	
	@Autowired
	RecentMapper RecentMapper;

	@Override
	public List<RecentVO> recentBoard(RecentVO vo) {
		return RecentMapper.recentBoard(vo);
	}

	@Override
	public int insertRecent(RecentVO vo) {
		return RecentMapper.insertRecent(vo);
	}

}
