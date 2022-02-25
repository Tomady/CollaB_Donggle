package co.Donggle.CollaB.calendar.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.calendar.service.calendarMapper;
import co.Donggle.CollaB.calendar.service.calendarService;

@Repository("calendarDao")
public class calendarServiceImpl implements calendarService {

	@Autowired
	calendarMapper calendarMapper;
	
	@Override
	public List<calendarVO> calendarList() {
		
		return calendarMapper.calendarList();
	}

	@Override
	public calendarVO calendarSelect() {
		
		return calendarMapper.calendarSelect();
	}

	@Override
	public int updateCalendar(calendarVO vo) {
		
		return calendarMapper.updateCalendar(vo);
	}

}
