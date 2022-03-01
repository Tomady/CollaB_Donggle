package co.Donggle.CollaB.board.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class BoardController {
	@Autowired BoardService boardDao;
	@Autowired WorkspaceService workspaceDao;
	@Autowired WorkspaceJoinService workspaceJoinDao;
	
	//보드 테마 변경
	@ResponseBody
	@RequestMapping("/AjaxChangeBoardThema")
	public String AjaxChangeBoardThema(@RequestParam("thema")String thema,
									   @RequestParam("boardId") int boardId) {
		String result = "";
		BoardVO vo = new BoardVO();
		vo.setBoard_id(boardId);
		vo.setBoard_thema(thema);
		int n = boardDao.changeBoardThema(vo);
		if(n > 0) {
			result = "YES";
		}else if(n == 0) {
			result = "NO";
		}
		
		return result;
	}
	
	//보드 이름 변경
	@ResponseBody
	@RequestMapping("/AjaxBoardRename")
	public String AjaxBoardRename(@RequestParam("boardId") int boardId,
								@RequestParam("newname") String boardName) {
		String result = "";
		BoardVO vo = new BoardVO();
		vo.setBoard_id(boardId);
		vo.setBoard_Title(boardName);
		
		int n = boardDao.boardRename(vo);
		if(n > 0) {
			result = "YES";
		}else if(n == 0) {
			result = "NO";
		}
		
		return result;
	}
	
	//하나의 보드 클릭시 해당 보드 상세페이지로 이동
	@RequestMapping("/boardDetail")
	public String goBoardDetails(@RequestParam("boardID") int bId,
								 Model model,
								 HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(bId);
		//사이드바때문에 goBoards랑 보내주는 명 같아야함
		model.addAttribute("workspace",boardDao.selectBoard(vo)); //워크스페이스ID,워크스페이스이름,보드이름,보드테마
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId)); //사용자가 가지고 있는 모든 워크스페이스
		//사이드바에 포함안되는 내용
		model.addAttribute("boardStar",boardDao.selectBoardStar(vo)); //즐겨찾기 유무
		model.addAttribute("boardID",bId);//해당보드 아이디
		return "board/board_details";
	}
	
	//boards페이지 그려줄 때 바로 실행될 함수
	//해당 워크스페이스에서 사용자가 초대된 보드목록 뿌려주기
	@ResponseBody
	@RequestMapping("/AjaxBoardList")
	public List<BoardVO> AjaxBoardList(@RequestParam("workspaceID") int wkid){
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setWorkspace_id(wkid);
		vo.setId(userId);
		
		return boardDao.boardsList(vo);//사용자가 가지고 있는 모든 보드
	}
	
	//사용자가 워크스페이스 클릭시 해당 워크스페이스의 boards페이지로 이동
	@RequestMapping("/goBoards")
	public String goBoards(HttpServletRequest hsrq,
					 	   HttpSession session,
						   Model model) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		WorkspaceVO wvo = new WorkspaceVO();
		wvo.setWorkspace_id(Integer.parseInt(hsrq.getParameter("wkId")));
		//사이드바때문에 boardDetail랑 보내주는 명 같아야함
		model.addAttribute("workspace",workspaceDao.searchWorkspace(wvo)); //워크스페이스ID,생성자아이디,생성일자,워크스페이스이름
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId)); //사용자가 가지고 있는 모든 워크스페이스
		
		return "board/boards";
	}
	
	//쪽지함 헤더 - Workspace - 특정워크스페이스클릭 - 해당워크스페이스 boards페이지로 이동
	@RequestMapping("/Boards")
	public String goBoards(@RequestParam("wkid") int wkid,
					 	   HttpSession session,
						   Model model) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		WorkspaceVO wvo = new WorkspaceVO();
		wvo.setWorkspace_id(wkid);
		//사이드바때문에 boardDetail랑 보내주는 명 같아야함
		model.addAttribute("workspace",workspaceDao.searchWorkspace(wvo)); //워크스페이스ID,생성자아이디,생성일자,워크스페이스이름
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId)); //사용자가 가지고 있는 모든 워크스페이스
		
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
