package co.Donggle.CollaB.recent.service;

import java.util.List;

public interface RecentMapper {
	
	// 최근 본 목록 리스트
	List<RecentVO> recentBoard();
		
	// recent 테이블에 봤던 Board 추가하기
	int insertRecent(RecentVO vo);

}
