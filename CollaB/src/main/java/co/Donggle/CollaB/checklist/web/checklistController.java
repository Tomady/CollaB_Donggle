package co.Donggle.CollaB.checklist.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.checklist.service.checklistService;
import co.Donggle.CollaB.checklist.service.checklistVO;
import co.Donggle.CollaB.checklist.service.itemInfoService;
import co.Donggle.CollaB.checklist.service.itemInfoVO;

@Controller
public class checklistController {
	
	@Autowired
	checklistService checklistDao;
	
	@Autowired
	itemInfoService itemInfoDao;
	
	// 체크리스트 페이지
	@RequestMapping("/checklist.do")
	public String checklist(Model model) {
		
		List<checklistVO> checklist = checklistDao.chklistAll();
		List<itemInfoVO> itemlist = itemInfoDao.itemList();
		
		model.addAttribute("checklist", checklist);
		model.addAttribute("itemlist", itemlist);
		
		return "checklist/checklist";
	}
	
	// 체크리스트 등록하기
	@RequestMapping("/addchecklist")
	@ResponseBody
	public void addchecklist(checklistVO vo) {
		System.out.println(vo.getChecklist_title());
		checklistDao.chklistAdd(vo);
		
	}
	
	// 아이템 등록하기
	@RequestMapping("/additem")
	@ResponseBody
	public void additem(itemInfoVO vo) {
		itemInfoDao.additem(vo);
	}
	
	// 아이템 삭제하기
	@RequestMapping("/itemdelete")
	public String itemdelete(int item_id) {
		int r = itemInfoDao.deleteitem(item_id);
		if (r > 0) {
			return "redirect:checklist.do";
		} else {
			return "redirect:cheklist.do";
		}
	}

}
