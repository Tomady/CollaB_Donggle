package co.Donggle.CollaB.list.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.list.service.ListService;
import co.Donggle.CollaB.list.service.ListVO;

@Controller
public class ListController {
	@Autowired private ListService listDao;
	
	//리스트 생성, 리턴으로 방금 만든 리스트정보 보내주기
	@ResponseBody
	@RequestMapping("/AjaxCreateList")
	public ListVO AjaxCreateList(@RequestParam("listTitle") String listTitle,
								 @RequestParam("boardID") int boardID,
								 HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		ListVO vo = new ListVO();
		vo.setList_title(listTitle);
		vo.setBoard_id(boardID);
		vo.setId(userId);
		
		listDao.insertList(vo);
		return listDao.selectCurrentList();
	}
}
