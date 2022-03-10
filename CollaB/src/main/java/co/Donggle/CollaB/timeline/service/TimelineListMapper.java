package co.Donggle.CollaB.timeline.service;

import java.util.List;

public interface TimelineListMapper {
	// 해당 보드의 리스트 목록
	List<TimelineListVO> timeList(TimelineListVO vo);
	
	// 타임라인 페이지에서 리스트 추가
	int insertList(TimelineListVO vo);
}
