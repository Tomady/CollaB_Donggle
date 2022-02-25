package co.Donggle.CollaB.checklist.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class checklistController {
	
	// 체크리스트 페이지
	@RequestMapping("/checklist.do")
	public String checklist() {
		return "checklist/checklist";
	}

}
