package co.Donggle.CollaB.calendar.service;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.calendar.service.calendarMapper;
import co.Donggle.CollaB.calendar.service.calendarService;
import co.Donggle.CollaB.card.service.CardVO;

@Repository("calendarDao")
public class calendarServiceImpl implements calendarService {

	@Autowired
	calendarMapper calendarMapper;
	
	@Override
	public List<CardVO> calendarList() {
		
		return calendarMapper.calendarList();
	}

	@Override
	public CardVO calendarSelect() {
		
		return calendarMapper.calendarSelect();
	}

	@Override
	public int updateCalendar(CardVO vo) {
		
		return calendarMapper.updateCalendar(vo);
	}

}
