package co.Donggle.CollaB.message.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.message.service.InboxService;
import co.Donggle.CollaB.message.service.InboxVO;
import co.Donggle.CollaB.message.service.SentService;
import co.Donggle.CollaB.message.service.SentVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;

@Controller
public class MessageController {
	@Autowired InboxService inboxDao;
	@Autowired SentService sentDao;
	@Autowired WorkspaceJoinService workspaceJoinDao;
	
	//=====inbox=====
	@RequestMapping("/message_inbox")
	public String message_inbox(HttpSession session,
								Model model) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		InboxVO vo = new InboxVO();
		vo.setId(userId);
		
		//사용자의 워크스페이스 목록도 모델로 보내주기(새쪽지쓸때 필요)
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId));
		//사용자의 읽지않은 메시지 몇개인지 모델로 보내주기(사이드바에 필요)
		int unreadCnt = inboxDao.inboxUnreadMsg(vo);
		model.addAttribute("unreadMSG",unreadCnt);
		model.addAttribute("inbox",inboxDao.inboxList(vo));
		return "msg_inbox";
	}
	
	//받은메시지함 삭제 - inbox
	@ResponseBody
	@RequestMapping("/AjaxInboxMsgDelete")
	public String AjaxDeleteMSG(HttpServletRequest request,
								HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		String[] inboxMsgID = request.getParameterValues("inboxMsgID");
		InboxVO vo = new InboxVO();
		vo.setId(userId);
		int n = 0;
		for(int i = 0; i < inboxMsgID.length; i++) {
			int id = Integer.parseInt(inboxMsgID[i]);
			vo.setInbox_id(id);
			n += inboxDao.inboxMsgDelete(vo);
		}
		
		String result = "";
		if(n == inboxMsgID.length) {
			result = "YES";
		}else if(n != inboxMsgID.length) {
			result = "NO";
		}
		
		return result;
	}
	
	//받은메시지함 unread메시지만 가져오기
	@ResponseBody
	@RequestMapping("/AjaxUnreadInbox")
	public List<InboxVO> AjaxUnreadInbox(HttpSession session){
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		InboxVO vo = new InboxVO();
		vo.setId(userId);
		
		return inboxDao.unreadList(vo);
	}
	
	//메시지 한건조회 & receive_confirm값도 Y로 변경해주기
	@ResponseBody
	@RequestMapping("/AjaxSelectInboxMsg")
	public InboxVO AjaxSelectInboxMsg(@RequestParam("msgID") int msgID) {
		InboxVO vo = new InboxVO();
		vo.setInbox_id(msgID);
		
		int n = inboxDao.inboxMsgConfirm(vo);
		if(n > 0) {
			System.out.println("메시지확인완료 receive_confirm = Y");
		}
		return inboxDao.inboxSelectMsg(vo);			
	}
	
	//즐겨찾기 추가 | 해제
	@ResponseBody
	@RequestMapping("/AjaxStarInbox")
	public String AjaxStarInbox(@RequestParam("inboxID") int inboxID,
								@RequestParam("d") String d) {
		String result = "";
		InboxVO vo = new InboxVO();
		vo.setReceive_star(d);
		vo.setInbox_id(inboxID);
		
		int n = inboxDao.starMsg(vo);
		if(n > 0) {
			result = "YES";
		}else if(n == 0) {
			result = "NO";
		}
		
		return result;
	}
	
	//메시지 보내기 - inbox, sent테이블 두개 다에 insert해주기
	@ResponseBody
	@RequestMapping("/AjaxSendMessage")
	public String AjaxSendMessage(@RequestParam("dear") String dear,
								  @RequestParam("title") String title,
								  @RequestParam("contents") String contents,
								  HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		String result = "";

		//괄호안에 값만 추출
		int start = -1;
		int end = -1;
		if(dear.contains("(")) {
			start = dear.indexOf("(");
			end = dear.indexOf(")");
			dear = dear.substring(start+1, end);
		}
	
		int inboxResult = -1;
		InboxVO inbox = new InboxVO();
		inbox.setId(dear);
		inbox.setReceive_title(title);
		inbox.setReceive_contents(contents);
		inbox.setReceive_from(userId);
		inbox.setReceive_star("N");
		inbox.setReceive_confirm("N");
		inboxResult = inboxDao.inboxMsgInsert(inbox);
		
		int sentResult = -1;
		SentVO sent = new SentVO();
		sent.setId(userId);
		sent.setSent_title(title);
		sent.setSent_contents(contents);
		sent.setSent_to(dear);
		sent.setSent_star("N");
		sentResult = sentDao.sentMsgInsert(sent);
		
		if(inboxResult+sentResult == 2) {
			result = "YES";
		}else {
			result = "NO";
		}
		
		return result;
	}
	
	//받은메시지함 검색 - 보낸사람별로 검색
	@ResponseBody
	@RequestMapping("/AjaxInboxSearch_writer")
	public List<InboxVO> AjaxInboxSearch_writer(@RequestParam("searchVal") String searchVal,
												HttpSession session){
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		InboxVO vo = new InboxVO();
		vo.setId(userId);
		vo.setReceive_from(searchVal);
		
		return inboxDao.inboxSearch_writer(vo);
	}
	
	//받은메시지함 검색 - 제목별로 검색
	@ResponseBody
	@RequestMapping("/AjaxInboxSearch_title")
	public List<InboxVO> AjaxInboxSearch_title(@RequestParam("searchVal") String searchVal,
											   HttpSession session){
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		InboxVO vo = new InboxVO();
		vo.setId(userId);
		vo.setReceive_title(searchVal);
		
		return inboxDao.inboxSearch_title(vo);
	}
	
	//=====sent=====
	@RequestMapping("/message_sent")
	public String message_sent(HttpSession session,
							   Model model) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		InboxVO inbox = new InboxVO();
		inbox.setId(userId);
		
		SentVO vo = new SentVO();
		vo.setId(userId);
		model.addAttribute("sent",sentDao.sentMsgList(vo));
		//새쪽지쓰기-사용자의 워크스페이스 목록
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId));
		//사용자의 읽지않은 메시지 몇개인지 모델로 보내주기(사이드바에 필요)
		int unreadCnt = inboxDao.inboxUnreadMsg(inbox);
		model.addAttribute("unreadMSG",unreadCnt);
		
		return "msg_sent";
	}
	
	//보낸메시지함 삭제 - Sent
	@ResponseBody
	@RequestMapping("/AjaxSentMsgDelete")
	public String AjaxSentMsgDelete(HttpServletRequest request,
								    HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		String[] sentMsgID = request.getParameterValues("sentMsgID");
		SentVO vo = new SentVO();
		vo.setId(userId);
		int n = 0;
		for(int i = 0; i < sentMsgID.length; i++) {
			int id = Integer.parseInt(sentMsgID[i]);
			vo.setSent_id(id);
			n += sentDao.sentMsgDelete(vo);
		}
		
		String result = "";
		if(n == sentMsgID.length) {
			result = "YES";
		}else if(n != sentMsgID.length) {
			result = "NO";
		}
		
		return result;
	}
	
	//보낸메시지 조회
	@ResponseBody
	@RequestMapping("/AjaxSelectSentMsg")
	public SentVO AjaxSelectSentMsg(@RequestParam("msgID") int msgId){
		SentVO vo = new SentVO();
		vo.setSent_id(msgId);
		
		return sentDao.sentMsgSelect(vo);
	}
	
	//보낸메시지 즐겨찾기처리
	@ResponseBody
	@RequestMapping("/AjaxStarSent")
	public String AjaxStarSent(@RequestParam("sentID") int sentid,
							   @RequestParam("d") String star) {
		String result = "";
		SentVO vo = new SentVO();
		vo.setSent_id(sentid);
		vo.setSent_star(star);
		
		int n = sentDao.sentMsgStar(vo);
		if(n > 0) {
			result = "YES";
		}else if(n == 0) {
			result = "NO";
		}
		
		return result;
	}
	
	//보낸메시지함 검색-받는사람별
	@ResponseBody
	@RequestMapping("/AjaxSentSearch_to")
	public List<SentVO> AjaxSentSearch_to(@RequestParam("searchVal") String searchVal,
										  HttpSession session){
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		SentVO vo = new SentVO();
		vo.setId(userId);
		vo.setSent_to(searchVal);
		
		return sentDao.sentSearch_to(vo);
	}
	
	//보낸메시지함 검색-제목별
	@ResponseBody
	@RequestMapping("/AjaxSentSearch_title")
	public List<SentVO> AjaxSentSearch_title(@RequestParam("searchVal") String searchVal,
											 HttpSession session){
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		SentVO vo = new SentVO();
		vo.setId(userId);
		vo.setSent_title(searchVal);
		
		return sentDao.sentSearch_title(vo);
	}
	
	//=====starred=====
	@RequestMapping("/message_starred")
	public String message_starred(HttpSession session,
								  Model model) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		InboxVO inbox = new InboxVO();
		inbox.setId(userId);
		
		model.addAttribute("starList",inboxDao.inboxStarList(inbox));
		//새쪽지쓰기-사용자의 워크스페이스 목록
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId));
		//사용자의 읽지않은 메시지 몇개인지 모델로 보내주기(사이드바에 필요)
		int unreadCnt = inboxDao.inboxUnreadMsg(inbox);
		model.addAttribute("unreadMSG",unreadCnt);
		
		return "msg_starred";
	}
	
	//중요편지함 검색-보낸사람별로
	@ResponseBody
	@RequestMapping("/AjaxStarredSearch_writer")
	public List<InboxVO> AjaxStarredSearch_writer(@RequestParam("searchVal") String searchVal,
										   HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		InboxVO vo = new InboxVO();
		vo.setId(userId);
		vo.setReceive_from(searchVal);
		
		return inboxDao.inboxStarSearch_writer(vo);
	}
	
	//중요편지함 검색-제목별로
	@ResponseBody
	@RequestMapping("/AjaxStarredSearch_title")
	public List<InboxVO> AjaxStarredSearch_title(@RequestParam("searchVal") String searchVal,
										  HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		InboxVO vo = new InboxVO();
		vo.setId(userId);
		vo.setReceive_title(searchVal);
		
		return inboxDao.inboxStarSearch_title(vo);
	}
	
	
}
