package co.Donggle.CollaB.calendar.web;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.Donggle.CollaB.calendar.service.calendarService;
import co.Donggle.CollaB.calendar.service.calendarVO;

@Controller
public class calendarController {
	
	@Autowired
	private calendarService calendarDao;
	
	// 캘린더 페이지
	@RequestMapping("/calendar.do")
	public String calendar(/*@RequestParam("boardId") int boardId,*/ HttpServletRequest request, Model model) {
		
		calendarVO vo = new calendarVO();
//		vo.setBoard_id(boardId);
		
//		model.addAttribute("boardId", boardId);
		return "calendar/calendar";
	}
	
	
	// 일정 가져오기
//	@RequestMapping("/dbCalendar")
//	@ResponseBody
//	public List<calendarVO> dbCalendar(calendarVO vo) {
//		
//		return calendarDao.calendarList();
//		
//	}
	
	// 일정 가져오기
	@RequestMapping("/dbCalendar")
	@ResponseBody
	HashMap<String, Object> dbCalendar(calendarVO vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		List<calendarVO> list = calendarDao.calendarList();
		map.put("list", list);
		return map;
		
	}
	
	// 일정 보기
//	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
//	public ModelAndView calendar(ModelAndView mv, HttpServletRequest request) {
//		String viewpage = "calendar/calendar";
//		List<calendarVO> calendar = null;
//		calendarVO vo = new calendarVO();
//		
//		try {
//			calendar = calendarDao.calendarList();
//			request.setAttribute("calendarList", calendar);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		mv.setViewName(viewpage);
//		return mv;
//	}
	
	// 일정 변경 처리
	@RequestMapping(value = "/dateUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String dateUpdate(@RequestBody calendarVO vo) {
		//int r = calendarDao.updateCalendar(vo);
		calendarDao.updateCalendar(vo);
		System.out.println(vo.getCard_start_date());
		System.out.println(vo.getCard_end_date());
		return "dateUpdate";
	}
	
}
