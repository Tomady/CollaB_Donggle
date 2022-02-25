package co.Donggle.CollaB.checklist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.Donggle.CollaB.checklist.service.checklistService;
import co.Donggle.CollaB.checklist.service.checklistVO;

@Controller
public class checklistController {
	
	@Autowired
	checklistService checklistDao;
	
	// 체크리스트 페이지
	@RequestMapping("/checklist.do")
	public String checklist(Model model) {
		
		List<checklistVO> chklist = checklistDao.chklistAll();
		return "checklist/checklist";
	}

}
