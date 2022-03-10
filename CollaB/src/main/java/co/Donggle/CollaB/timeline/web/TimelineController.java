package co.Donggle.CollaB.timeline.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.Donggle.CollaB.timeline.service.TimelineCardMapper;
import co.Donggle.CollaB.timeline.service.TimelineListMapper;

@Controller
public class TimelineController {
	
	@Autowired TimelineCardMapper cardDao;
	@Autowired TimelineListMapper listDao;
	
	
	// 타임라인 페이지 이동
	@RequestMapping("/timeline.do")
	public String timeline() {
		return "timeline/timeline";
	}
	
	// 해당 보드의 리스트 출력
	
	// 타임라인에서 리스트 추가
	
	// 리스트 클릭 시 카드 내용 캘린더에 출력
	
	// 타임라인에서 카드 추가
}
