package co.Donggle.CollaB.calendar.web;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.Donggle.CollaB.calendar.service.calendarService;
import co.Donggle.CollaB.calendar.service.calendarVO;

@Controller
public class calendarController {
	
	@Autowired
	private calendarService calendarDao;
	
	// 일정 보기
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public ModelAndView calendar(ModelAndView mv, HttpServletRequest request) {
		String viewpage = "calendar/calendar";
		List<calendarVO> calendar = null;
		
		try {
			calendar = calendarDao.calendarList();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	// 일정 변경 처리
	@RequestMapping(value = "/dateUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String dateUpdate(@RequestBody calendarVO vo) {
		calendarDao.updateCalendar(vo);
		System.out.println(vo.getCard_start_date());
		System.out.println(vo.getCard_end_date());
		return "dateUpdate";
	}
	
	// 해당 이벤트에 해당하는 카드 상세 보기
	
}
