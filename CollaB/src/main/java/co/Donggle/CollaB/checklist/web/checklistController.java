package co.Donggle.CollaB.checklist.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.card.service.CardVO;
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
	@RequestMapping("/AjaxAddCheckList")
	@ResponseBody
	public checklistVO addchecklist(checklistVO vo) {
		checklistDao.chklistAdd(vo); //체크리스트 추가

		return checklistDao.selectCheckList(vo);
	}
	
	// 아이템 등록하기
	@RequestMapping("/AjaxAddCheckListItem")
	@ResponseBody
	public itemInfoVO additem(itemInfoVO vo) {
		itemInfoDao.additem(vo); //아이템 추가
		
		return itemInfoDao.selectItem(vo); 
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
	
	//카드상세조회 _ 체크리스트삭제 : 매개값 - 체크리스트아이디
	@ResponseBody
	@RequestMapping("/AjaxDeleteCheckList")
	public String AjaxDeleteCheckList(CardVO cardvo) {
		int n = checklistDao.chklistDelete(cardvo);
		n += itemInfoDao.deleteItemAll(cardvo);
		
		return n > 0 ? "YES" : "NO";
	}
	
	//카드상세조회 _ 체크리스트 아이템 클릭시 상태변경 : 매개값 - 아이템아이디, 아이템상태
	@ResponseBody
	@RequestMapping("/AjaxCheckListItemStatusUpdate")
	public String AjaxCheckListItemStatusUpdate(CardVO vo) {
		int n = itemInfoDao.modifyitemyn(vo);
		
		return n > 0 ? "YES" : "NO";
	}

}
