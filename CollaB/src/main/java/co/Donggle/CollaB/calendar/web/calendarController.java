package co.Donggle.CollaB.calendar.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import co.Donggle.CollaB.calendar.service.calendarService;
import co.Donggle.CollaB.card.service.CardVO;

@Controller
public class calendarController {
	
	@Autowired
	private calendarService calendarDao;
	
	// 일정 보기
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public ModelAndView calendar(ModelAndView mv, HttpServletRequest request) {
		String viewpage = "calendar/calendar";
		List<CardVO> calendar = null;
		
		try {
			calendar = calendarDao.calendarList();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
}
