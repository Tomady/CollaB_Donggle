package co.Donggle.CollaB.board.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;

@Controller
public class BoardController {
	@Autowired BoardService boardDao;
	
	//하나의 보드 클릭시 해당 보드 상세페이지로 이동
	@RequestMapping("/goBoardDetails")
	public String goBoardDetails(@RequestParam("boardId") int bId,
								 @RequestParam("boardName") String bName,
								 @RequestParam("boardThema") String bThema,
								 @RequestParam("WkId") int wId,
								 @RequestParam("WkName") String wName,
								 Model model,
								 HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(bId);
		model.addAttribute("boardStar",boardDao.selectBoardStar(vo));
		model.addAttribute("boardName",bName);
		model.addAttribute("workspaceId",wId);
		model.addAttribute("workspaceName",wName);
		
		if(bThema=="red"){
			model.addAttribute("boardHeaderColor","rgb(247,123,123)");
			model.addAttribute("mainHeaderColor","rgb(252,205,205)");
			model.addAttribute("pageBody","rgb(252, 162, 162)");
	    }else if(bThema=="orange"){
	    	model.addAttribute("boardHeaderColor","rgb(252,187,127)");
			model.addAttribute("mainHeaderColor","rgb(255, 205, 158)");
			model.addAttribute("pageBody","rgb(247,217,189)");
	    }else if(bThema=="yellow"){
	    	model.addAttribute("boardHeaderColor","rgb(253, 207, 80)");
			model.addAttribute("mainHeaderColor","rgb(255,242,130)");
			model.addAttribute("pageBody","rgb(248,244,204)");
	    }else if(bThema=="green"){
	    	model.addAttribute("boardHeaderColor","rgb(86,161,111)");
			model.addAttribute("mainHeaderColor","rgb(164,230,186)");
			model.addAttribute("pageBody","rgb(218,247,228)");
	    }else if(bThema=="skyblue"){
	    	model.addAttribute("boardHeaderColor","rgb(100,240,245)");
			model.addAttribute("mainHeaderColor","rgb(68, 209, 228)");
			model.addAttribute("pageBody","rgb(203, 248, 250)");
	    }else if(bThema=="blue"){
	    	model.addAttribute("boardHeaderColor","rgb(121,162,250)");
			model.addAttribute("mainHeaderColor","rgb(168, 195, 252)");
			model.addAttribute("pageBody","rgb(209, 231, 241)");
	    }else if(bThema=="darkblue"){
	    	model.addAttribute("boardHeaderColor","rgb(123,125,247)");
			model.addAttribute("mainHeaderColor","rgb(168,169,238)");
			model.addAttribute("pageBody","rgb(192, 193, 250)");
	    }else if(bThema=="purple"){
	    	model.addAttribute("boardHeaderColor","rgb(171,127,252)");
			model.addAttribute("mainHeaderColor","rgb(199, 174, 247)");
			model.addAttribute("pageBody","rgb(204, 195, 226)");
	    }else if(bThema=="pink"){
	    	model.addAttribute("boardHeaderColor","rgb(250,167,243)");
			model.addAttribute("mainHeaderColor","rgb(243,183,238)");
			model.addAttribute("pageBody","rgb(248,233,247)");
	    }else if(bThema=="gray"){
	    	model.addAttribute("boardHeaderColor","rgb(184,184,184)");
			model.addAttribute("mainHeaderColor","rgb(124,124,124)");
			model.addAttribute("pageBody","rgb(241,241,241)");
	    }else if(bThema=="darkgray"){
	     	model.addAttribute("boardHeaderColor","rgb(116,115,115)");
			model.addAttribute("mainHeaderColor","rgb(83,83,83)");
			model.addAttribute("pageBody","rgb(119,116,116)");
	    }else if(bThema=="black"){
	    	model.addAttribute("boardHeaderColor","rgb(73,73,73)");
			model.addAttribute("mainHeaderColor","rgb(43,43,43)");
			model.addAttribute("pageBody","rgb(12,12,12)");
	    }else if(bThema=="base"){
	    	model.addAttribute("boardHeaderColor","#6553C1");
			model.addAttribute("mainHeaderColor","#9F90D9");
			model.addAttribute("pageBody","#ECE9FE");
	    }

		return "board/board_details";
	}
	
	//사용자가 워크스페이스 클릭시 해당 워크스페이스의 boards페이지로 이동
	@RequestMapping("/goBoards")
	public String goBoards(@RequestParam("wkid") int wkid,
						   @RequestParam("wkname") String wkname,
						   HttpSession session,
						   Model model) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setWorkspace_id(wkid);
		vo.setId(userId);
		model.addAttribute("wkid",wkid);
		model.addAttribute("wkname",wkname);
		model.addAttribute("boards",boardDao.boardsList(vo));
		
		return "board/boards";
	}
	
	//보드가입탈퇴
	@ResponseBody
	@RequestMapping("/AjaxBoardJoinDelete")
	public String AjaxBoardDelete(@RequestParam("boardID") int boardID,
								  @RequestParam("workID") int workID,
								  HttpSession session) {
		String result = "";
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(boardID);
		vo.setWorkspace_id(workID);
		int n = boardDao.boardJoinDelete(vo);
		if(n > 0) {
			result = "YES";
		}else if(n == 0) {
			result = "NO";
		}
			
		return result;
	}
}
