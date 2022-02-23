package co.Donggle.CollaB.calendar.service;

import java.util.List;

import co.Donggle.CollaB.card.service.CardVO;

public interface calendarMapper {
	
	List<CardVO> calendarList(); // 일정 목록 달력에
	CardVO calendarSelect(); // 일정 상세보기
	int updateCalendar(CardVO vo); // 일정 변경

}
