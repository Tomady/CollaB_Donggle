package co.Donggle.CollaB.calendar.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.card.service.CardVO;

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

	@Override
	public List<CardVO> calendarAllCard(int boardId) {
		
		return calendarMapper.calendarAllCard(boardId);
	}

	@Override
	public List<CardVO> listPlanList(CardVO vo) {

		return calendarMapper.listPlanList(vo);
	}

	@Override
	public int calCardInsert(calendarVO vo) {

		return calendarMapper.calCardInsert(vo);
	}

}
