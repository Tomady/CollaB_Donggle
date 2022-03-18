package co.Donggle.CollaB.workspace.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.card.service.CardService;
import co.Donggle.CollaB.card.service.CardVO;
import co.Donggle.CollaB.list.service.ListService;
import co.Donggle.CollaB.list.service.ListVO;
import co.Donggle.CollaB.recent.service.RecentService;
import co.Donggle.CollaB.recent.service.RecentVO;
import co.Donggle.CollaB.user.service.UserVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinVO;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class WorkspaceController {
	@Autowired WorkspaceJoinService workspaceJoinDao;
	@Autowired WorkspaceService workspaceDao;
	@Autowired BoardService boardDao;
	@Autowired ListService listDao;
	@Autowired CardService cardDao;
	@Autowired RecentService RecentDao;

	// 로그인 후 바로 보이는 워크스페이스 목록 페이지
	@RequestMapping("/WorkspaceList")
	public String WorkspaceList(Model model, HttpSession session) {
		// 세션에 있는 아이디값 넣어서 해당 유저가 워크스페이스를 하나이상 가지고 있는지 확인.
		String returnPage = "";
		String userId = (String) session.getAttribute("id");
		int n = workspaceJoinDao.workspaceJoinCount(userId);
		
		// recent
		RecentVO recentvo = new RecentVO();
		recentvo.setId(userId);
		List<RecentVO> recents = new ArrayList<RecentVO>();
		recents = RecentDao.recentBoard(recentvo);

		if (n > 0) {
			// 워크스페이스 하나 이상 존재 - 해당 사용자의 워크스페이스와 가입된 보드리스트 넘기기
			// 해당 사용자가 ADMIN인 워크스페이스 목록 보내주기
			model.addAttribute("meAdmin", workspaceJoinDao.workspaceListMeAdmin(userId));
			model.addAttribute("workspaces", workspaceJoinDao.workspaceJoinList(userId));
			model.addAttribute("boards", boardDao.boardList(userId));
			model.addAttribute("recents", recents);
			returnPage = "workspaceList";
		} else if (n == 0) {
			// 워크스페이스 없음
			returnPage = "workspaceNone";
		}

		return returnPage;
	}

	// 워크스페이스 생성 모달-create버튼 클릭-워크스페이스 만들기
	@ResponseBody
	@RequestMapping("/AjaxCreateWorkspace")
	public String AjaxCreateWorkspace(HttpSession session, @RequestParam("wkspaceName") String wkspaceName) {
		String result = "";
		// 세션에 있는 아이디값으로 insert하기
		String userId = (String) session.getAttribute("id");

		WorkspaceVO wkVO = new WorkspaceVO();
		wkVO.setWorkspace_title(wkspaceName);
		wkVO.setId(userId);
		WorkspaceJoinVO wkJoinVo = new WorkspaceJoinVO();
		wkJoinVo.setId(userId);
		wkJoinVo.setPermissions("ADMIN");

		int n = workspaceDao.workspaceInsert(wkVO);
		
		if (n > 0) {
			int num = workspaceJoinDao.workspaceJoinInsert(wkJoinVo);
			if (num > 0) {
				int wkid = workspaceDao.selectWorkspaceMaxId();
				result = Integer.toString(wkid);
			} else if (num == 0) {
				result = "NO";
			}
		} else if (n == 0) {
			result = "NO";
		}

		return result;
	}

	// 워크스페이스 이름 변경
	@ResponseBody
	@RequestMapping("/AjaxWorkspaceRename")
	public String AjaxWorkspaceRename(@RequestParam("newWSName") String newWSName, @RequestParam("wkid") int wkid,
			Model model) {
		String result = "";
		WorkspaceVO vo = new WorkspaceVO();
		vo.setWorkspace_title(newWSName);
		vo.setWorkspace_id(wkid);
		int n = workspaceDao.workspaceRename(vo);
		if (n > 0) {
			result = "YES";
		} else if (n == 0) {
			result = "NO";
		}

		return result;
	}

	// 새 쪽지쓰기에서 워크스페이스 하나 클릭시, 해당 워크스페이스 조인멤버출력
	@ResponseBody
	@RequestMapping("/AjaxWorkspaceJoinMembers")
	public List<UserVO> AjaxWorkspaceJoinMembers(@RequestParam("workspaceID") int wkid) {
		WorkspaceJoinVO vo = new WorkspaceJoinVO();
		vo.setWorkspace_id(wkid);

		return workspaceJoinDao.workspaceTotalMember(vo);
	}

	//워크스페이스리스트페이지에서 워크스페이스 탈퇴, 해당워크스페이스의 보드도 탈퇴
	//만약 최후의 1인이면 워크스페이스 아예 삭제되게하기
	@ResponseBody
	@RequestMapping("/AjaxWorkspaceJoinDelete")
	public String AjaxWorkspaceJoinDelete(@RequestParam("wkid") int wkid, 
										  HttpSession session) {
		String result = "";
		String userId = (String) session.getAttribute("id");

		WorkspaceJoinVO wkjoin = new WorkspaceJoinVO();
		WorkspaceVO wkvo = new WorkspaceVO();
		BoardVO boardvo = new BoardVO();
		
		wkjoin.setId(userId);
		wkjoin.setWorkspace_id(wkid);
		wkvo.setWorkspace_id(wkid);
		boardvo.setId(userId);
		boardvo.setWorkspace_id(wkid);
		
		//해당워크스페이스에 있는 보드id목록 구하기
		List<BoardVO> boardIds = workspaceDao.boardIdListInWorkspace(wkvo);

		int n = 0;
		//탈퇴하려는 워크스페이스에 가입된 회원이 몇명인지 조회
		//만약 해당 사용자가 마지막 회원이라면 워크스페이스 자체도 삭제시키기
		int joinMemberCnt = workspaceJoinDao.workspaceJoinSearch(wkjoin);
		if(joinMemberCnt == 1) { //해당 사용자밖에 안남아있을때
			List<ListVO> listIds = new ArrayList<ListVO>(); //리스트id목록담기
			List<CardVO> cardIds = new ArrayList<CardVO>(); //카드id목록담기
			
			//1.해당보드들에 있는 리스트id목록 구하기
			for(BoardVO boardId : boardIds) {
				listIds = boardDao.listIdInBoard(boardId);
				
				//2.해당리스트들에 있는 카드id목록 구하기
				for(ListVO listId : listIds) {
					cardIds = listDao.selectCardIds(listId);
					
					//3.카드id목록 이용해서 카드댓글 아이디목록 구하기
					for(CardVO cardId : cardIds) {
						List<CardVO> commentids = cardDao.selectCommentIds(cardId);
						for(CardVO commentid : commentids) {
							//3-1.카드댓글 아이디이용해서 카드댓글첨부파일, 카드댓글좋아요 삭제
							n += cardDao.deleteCardCommentFile(commentid);
							n += cardDao.deleteCardCommentLike(commentid);
						}
					}
					//4.카드id목록 이용해서 첨부파일 아이디목록 구하기
					for(CardVO cardId : cardIds) {
						List<CardVO> fileids = cardDao.selectFileIds(cardId);
						for(CardVO fileid : fileids) {
							//4-1. 첨부파일 아이디 이용해서 첨부파일내역 삭제
							n += cardDao.deleteCardFileHistory(fileid);
						}
					}
					//5.카드id목록 이용해서 체크리스트 아이디목록 구하기
					for(CardVO cardId : cardIds) {
						List<CardVO> checkids = cardDao.selectCheckListIds(cardId);
						for(CardVO checkid : checkids) {
							//5-1. 체크리스트 아이디 이용해서 체크리스트 아이템 삭제
							n += cardDao.deleteCardCheckItems(checkid);
						}
					}
					//6.카드id목록 이용해서 카드댓글,체크리스트,카드첨부파일 삭제
					for(CardVO cardid : cardIds) {
						n += cardDao.deleteCardComment(cardid);
						n += cardDao.deleteCardCheckList(cardid);
						n +=cardDao.deleteCardFile(cardid);
					}
				}
				
				//7.리스트 아이디 이용해서 해당 리스트와 리스트 내 카드목록 삭제
				for(ListVO listid : listIds) {
					n += listDao.deleteList(listid);
					n += cardDao.deleteCards(listid);
				}
				
				// 8.보드 아이디이용해서 해당 보드 즐겨찾기내역전부, 보드가입내역전부 삭제
				n += boardDao.deleteBoardStars(boardId);
				n += boardDao.deleteBoardJoinAll(boardId);
				
			}
			//8.워크스페이스 아이디 이용해서 보드, 워크스페이스, 워크프세이스가입내역전부 삭제
			n += boardDao.deleteBoards(wkvo);
			n += workspaceJoinDao.workspaceJoinAllDelete(wkid);
			n += workspaceDao.workspaceDelete(wkvo);
			
		}else {
			//마지막 1인이 아닐경우
			//워크스페이스 가입내역, 보드 가입내역, 보드 즐겨찾기내역 삭제
			n += workspaceJoinDao.workspaceJoinDelete(wkjoin);
			
			if (n > 0) {
				int r = boardDao.boardJoinDrop(boardvo);
				if (r > 0) {
					//사용자 아이디 이용해서 보드즐겨찾기 내역 삭제
					n += boardDao.deleteBoardstar(boardvo);
					result = "YES";
				} else if (r == 0) {
					result = "NO";
				}
			} else if (n == 0) {
				result = "NO";
			}
		}
		
		return result;
	}
	
	//워크스페이스 관리자가 워크스페이스 삭제
	@ResponseBody
	@RequestMapping("AjaxWorkspaceDelete")
	public String AjaxWorkspaceDelete(@RequestParam("workspace_id") int wkid,
									  HttpSession session) {
		String userId = (String)session.getAttribute("id");
		String result = "";
		
		WorkspaceJoinVO wkjoin = new WorkspaceJoinVO();
		WorkspaceVO wkvo = new WorkspaceVO();
		BoardVO boardvo = new BoardVO();
		
		wkjoin.setId(userId);
		wkjoin.setWorkspace_id(wkid);
		wkvo.setWorkspace_id(wkid);
		boardvo.setId(userId);
		boardvo.setWorkspace_id(wkid);
		
		//해당워크스페이스에 있는 보드id목록 구하기
		List<BoardVO> boardIds = workspaceDao.boardIdListInWorkspace(wkvo);

		List<ListVO> listIds = new ArrayList<ListVO>(); //리스트id목록담을곳
		List<CardVO> cardIds = new ArrayList<CardVO>(); //카드id목록담을곳
		
		int n = 0;
		//1.해당보드들에 있는 리스트id목록 구하기
		for(BoardVO boardId : boardIds) {
			listIds = boardDao.listIdInBoard(boardId);
			
			//2.해당리스트들에 있는 카드id목록 구하기
			for(ListVO listId : listIds) {
				cardIds = listDao.selectCardIds(listId);
				
				//3.카드id목록 이용해서 카드댓글 아이디목록 구하기
				for(CardVO cardId : cardIds) {
					List<CardVO> commentids = cardDao.selectCommentIds(cardId);
					for(CardVO commentid : commentids) {
						//3-1.카드댓글 아이디이용해서 카드댓글첨부파일, 카드댓글좋아요 삭제
						n += cardDao.deleteCardCommentFile(commentid);
						n += cardDao.deleteCardCommentLike(commentid);
					}
				}
				//4.카드id목록 이용해서 첨부파일 아이디목록 구하기
				for(CardVO cardId : cardIds) {
					List<CardVO> fileids = cardDao.selectFileIds(cardId);
					for(CardVO fileid : fileids) {
						//4-1. 첨부파일 아이디 이용해서 첨부파일내역 삭제
						n += cardDao.deleteCardFileHistory(fileid);
					}
				}
				//5.카드id목록 이용해서 체크리스트 아이디목록 구하기
				for(CardVO cardId : cardIds) {
					List<CardVO> checkids = cardDao.selectCheckListIds(cardId);
					for(CardVO checkid : checkids) {
						//5-1. 체크리스트 아이디 이용해서 체크리스트 아이템 삭제
						n += cardDao.deleteCardCheckItems(checkid);
					}
				}
				//6.카드id목록 이용해서 카드댓글,체크리스트,카드첨부파일 삭제
				for(CardVO cardid : cardIds) {
					n += cardDao.deleteCardComment(cardid);
					n += cardDao.deleteCardCheckList(cardid);
					n += cardDao.deleteCardFile(cardid);
				}
			}
			
			//7.리스트 아이디 이용해서 해당 리스트와 리스트 내 카드목록 삭제
			for(ListVO listid : listIds) {
				n += listDao.deleteList(listid);
				n += cardDao.deleteCards(listid);
			}
			//8.보드아이디 이용해서 해당 보드가입내역, 보드즐겨찾기 내역 전부 없애기
			n += boardDao.deleteBoardJoinAll(boardId);
			n += boardDao.deleteBoardStars(boardId);
		}
		//9.워크스페이스 아이디 이용해서 보드들과 해당 워크스페이스, 워크스페이스 가입내역 삭제하기
		n += boardDao.deleteBoards(wkvo);
		n += workspaceDao.workspaceDelete(wkvo);
		n += workspaceJoinDao.workspaceJoinAllDelete(wkid);

		if (n > 0) {
			result = "YES";
		} else if (n == 0) {
			result = "NO";
		}
		
		return result;
	}
	
	//워크스페이스 검색
	@ResponseBody
	@RequestMapping("/AjaxWorkspaceListSearch")
	public List<WorkspaceVO> AjaxWorkspaceListSearch(WorkspaceVO vo, HttpSession session) {
		String userId = (String)session.getAttribute("id");
		vo.setId(userId);
		
		return workspaceDao.workspaceListSearch(vo);
	}
}
