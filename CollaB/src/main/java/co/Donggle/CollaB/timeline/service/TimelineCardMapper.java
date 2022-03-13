package co.Donggle.CollaB.timeline.service;

import java.util.List;

public interface TimelineCardMapper {
	// 날짜 등록되어 있는 카드 목록
	List<TimelineCardVO> timecardList();
	
	// 카드 목록 가져오기
	List<TimelineCardVO> timeCardSelect(TimelineCardVO vo);

	// 타임라인 페이지에서 카드 등록
	int insertCard(TimelineCardVO vo);
	
}
