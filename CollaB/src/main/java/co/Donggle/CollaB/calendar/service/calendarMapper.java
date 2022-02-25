package co.Donggle.CollaB.calendar.service;

import java.util.List;

public interface calendarMapper {
	
	List<calendarVO> calendarList(); // 일정 목록 달력에
	calendarVO calendarSelect(); // 일정 상세보기
	int updateCalendar(calendarVO vo); // 일정 변경

}
