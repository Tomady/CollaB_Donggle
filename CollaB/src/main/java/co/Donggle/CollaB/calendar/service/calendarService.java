package co.Donggle.CollaB.calendar.service;

import java.util.List;

import co.Donggle.CollaB.card.service.CardVO;

public interface calendarService {
	
	List<calendarVO> calendarList(); // 일정 목록 달력에
	calendarVO calendarSelect(); // 일정 상세보기
	int updateCalendar(calendarVO vo); // 일정 변경
	List<CardVO> listPlanList(CardVO vo); // 리스트별 일정 목록 가져오기
	List<CardVO> calendarAllCard(int boardId); // 해당 보드의 모든 카드

}
