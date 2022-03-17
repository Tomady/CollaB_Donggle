package co.Donggle.CollaB.memberPage.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.invite.service.InviteService;
import co.Donggle.CollaB.invite.service.InviteVO;
import co.Donggle.CollaB.memberPage.service.MemWorkspaceJoinService;
import co.Donggle.CollaB.memberPage.service.MemberPageUserService;
import co.Donggle.CollaB.recent.service.RecentService;
import co.Donggle.CollaB.recent.service.RecentVO;
import co.Donggle.CollaB.user.service.UserVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinVO;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class MemberPageController {

	@Autowired
	WorkspaceService workspaceDao;

	@Autowired
	WorkspaceJoinService workspaceJoinDao;

	@Autowired
	MemWorkspaceJoinService memWorkspaceJoinDao;

	@Autowired
	BoardService boardDao;

	@Autowired
	MemberPageUserService memberPageUserDao;

	@Autowired
	private JavaMailSender mail;

	@Autowired
	private InviteService inviteDao;
	
	@Autowired
	private RecentService RecentDao;

	@RequestMapping("/memberPage.do")
	public String memberPage(Model model, HttpSession session, WorkspaceVO vo, WorkspaceJoinVO jvo) {
		String userId = (String) session.getAttribute("id");
		int wkid = vo.getWorkspace_id();
		
		BoardVO boardvo = new BoardVO();
		boardvo.setWorkspace_id(wkid);
		boardvo.setId(userId);
		
		// recent
		RecentVO recentvo = new RecentVO();
		recentvo.setId(userId);
		List<RecentVO> recents = new ArrayList<RecentVO>();
		recents = RecentDao.recentBoard(recentvo);
		
		model.addAttribute("workspace", workspaceDao.searchWorkspace(vo));
		model.addAttribute("workspaceList", workspaceJoinDao.workspaceJoinList(userId)); // 사용자가 가지고 있는 모든 워크스페이스
		model.addAttribute("boardList", workspaceDao.boardListinWorkspace(vo)); // 해당워크스페이스가 가지고 있는 모든 보드 - admin은 다 볼
		model.addAttribute("boardStar", boardDao.selectBoardStar(boardvo));
		model.addAttribute("unStarBoards",boardDao.selectBoardNonStar(boardvo));
		model.addAttribute("recents", recents);
		
//		model.addAttribute("user_infoList", workspaceJoinDao.workspaceTotalMember(jvo)); // 워크스페이스의 유저 총 수
//		model.addAttribute("workspaceUserList", memWorkspaceJoinDao.workspaceJoinIdselect(jvo)); // 워크스페이스 권한

		return "member/memberPage";

	}

	@RequestMapping("/ajaxMemPageUserList.do")
	@ResponseBody
	public HashMap<String, List> ajaxMemPageUserList(WorkspaceJoinVO wJvo) {
		HashMap<String, List> map = new HashMap<String, List>();
		map.put("userList", workspaceJoinDao.workspaceTotalMember(wJvo));
		map.put("userAuthor", memWorkspaceJoinDao.memPageWorkspaceJoinIdselect(wJvo));

		return map;
	}

	@RequestMapping("/ajaxBoardsNub.do")
	@ResponseBody
	public List<BoardVO> ajaxBoardsNub(BoardVO vo) {
		String id = vo.getId();

		return boardDao.boardsList(vo);
	}

	@RequestMapping("/ajaxMemBoardsListRow.do")
	@ResponseBody
	public List<BoardVO> ajaxMemBoardsListRow(BoardVO vo) {

		return boardDao.boardsList(vo);

	}

	@RequestMapping("/ajaxMemPermissionsList.do")
	@ResponseBody
	public WorkspaceJoinVO ajaxMemChangePermission(WorkspaceJoinVO vo) {

		return memWorkspaceJoinDao.memPageWorkspaceJoinCurrentWorkspaceidUseridselect(vo);

	}

	@RequestMapping("/ajaxCuerrentUserPermissionChk.do")
	@ResponseBody
	public boolean ajaxPermissionChk(WorkspaceJoinVO vo, HttpSession session) {
		vo.setId((String) session.getAttribute("id"));

		vo = memWorkspaceJoinDao.memPageWorkspaceJoinCurrentWorkspaceidUseridselect(vo);
		String currentPermission = vo.getPermissions();

		if (currentPermission.contains("admin") || currentPermission.contains("ADMIN")) {

			return true;
		} else {

			return false;
		}
	}

	@RequestMapping("/ajaxCurrentWorkspacePermissionChk.do")
	@ResponseBody
	public boolean ajaxCurrentWorkspacePermissionChk(WorkspaceJoinVO vo) {
		List<WorkspaceJoinVO> list = memWorkspaceJoinDao.memPageWorkspaceJoinIdselect(vo);
		int chkNum = 0;
		for (WorkspaceJoinVO vo1 : list) {
			String adminChk = vo1.getPermissions();
			if (adminChk.contains("ADMIN") || adminChk.contains("admin"))
				chkNum++;
		}
		if (chkNum == 1)
			return false;
		else
			return true;

	}

	@RequestMapping("/ajaxTargetUserPermissionChange.do")
	@ResponseBody
	public boolean ajaxTargetUserPermissionChange(WorkspaceJoinVO vo) {
		int flag = memWorkspaceJoinDao.memPageWorkspaceJoinPermissionUpdate(vo);
		if (flag == 0) {
			return false;
		} else {
			return true;
		}
	}

	@RequestMapping("/ajaxSessionIdChk.do")
	@ResponseBody
	public boolean ajaxSessionChk(HttpSession session, String chkId) {
		String currentId = (String) session.getAttribute("id");
		if (chkId.equals(currentId)) {
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping("/ajaxMemPageBoardRemove.do")
	@ResponseBody
	public boolean ajaxMemPageBoardRemove(BoardVO vo, HttpSession session) {
		vo.setId((String) session.getAttribute("id"));
		int chk = boardDao.boardJoinDelete(vo);

		if (chk == 0) {
			return false;
		} else {
			return true;
		}
	}

	@RequestMapping("/ajaxSessionId.do")
	@ResponseBody
	public String ajaxSessionId(HttpSession session) {

		return (String) session.getAttribute("id");
	}

	@RequestMapping("/ajaxWorkspaceLeave.do")
	@ResponseBody
	public String ajaxWorkspaceLeave(WorkspaceJoinVO wjvo) {

		String id = wjvo.getId();

		for (BoardVO Bvo : boardDao.boardList(id)) {
			boardDao.boardJoinDelete(Bvo);
			boardDao.deleteBoardstar(Bvo);
		}

		workspaceJoinDao.workspaceJoinDelete(wjvo);

		return "true";
	}

	@RequestMapping("/ajaxWorkspaceTargetUserRemove.do")
	@ResponseBody
	public String ajaxWorkspaceTargetUserRemove(WorkspaceJoinVO wjvo) {
		BoardVO bvo = new BoardVO();
		bvo.setWorkspace_id(wjvo.getWorkspace_id());
		bvo.setId(wjvo.getId());

		for (BoardVO Bvo : boardDao.boardsList(bvo)) {
			Bvo.setId(wjvo.getId());
			boardDao.boardJoinDelete(Bvo);
			boardDao.deleteBoardstar(Bvo);
		}

		workspaceJoinDao.workspaceJoinDelete(wjvo);

		return "true";
	}

	@RequestMapping("/ajaxWorkspaceInviteInputValSearch.do")
	@ResponseBody
	public List<UserVO> ajaxWorkspaceInviteInputValSearch(UserVO vo) {
		
		return memberPageUserDao.memberPageUserSearch(vo);
	}

	@RequestMapping("/ajaxWorkspaceMemberInvite.do")
	@ResponseBody
	public String ajaxWorkspaceMemberInvite(UserVO vo, HttpSession session, WorkspaceJoinVO jwvo)
			throws MessagingException {
		String setFromUserName = (String) session.getAttribute("name");
		vo = memberPageUserDao.memberPageUserSelect(vo);
		String setToUserName = vo.getName();
		String setToUserEmail = vo.getEmail();
		String inviteCode = getRandomString(16);
		String user_emailconfirm = getRandomString(12);
		InviteVO ivo = new InviteVO();
		ivo.setInvite_code(inviteCode);
		ivo.setInvite_confirm("X");
		ivo.setWorkspace_id(jwvo.getWorkspace_id());
		ivo.setUser_email(setToUserEmail);
		ivo.setUser_emailconfirm(user_emailconfirm);
		
		
		

		MimeMessage message = mail.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		messageHelper.setFrom("yedammovie@gmail.com");
		messageHelper.setTo(setToUserEmail);
		messageHelper.setSubject("[CollaB] : " + setFromUserName + "님의 WorkSpace 초대장");
		String sb = "";
		sb = "<html><head>    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n"
				+ "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n"
				+ "    <link href=\"https://fonts.googleapis.com/css2?family=Jua&display=swap\" rel=\"stylesheet\">\r\n"
				+ "    </head>\r\n" + "\r\n" + "<body>\r\n"
				+ "              <div style=\"width: 420px; height: 500px; text-align: center; background-color: mediumaquamarine; font-family: 'Jua', sans-serif; display: inline-block;\">\r\n"
				+ "        <br><br>\r\n"
				+ "        <div><span style=\"font-size: 18px; font-weight: bold; color: #fff;\">협업을\r\n"
				+ "                더욱</span>&nbsp;<span\r\n"
				+ "                style=\"color: orangered; font-weight: bold; font-size: 20px;\">스마트</span>&nbsp;<span\r\n"
				+ "                style=\"font-weight: bold; color: #fff;  font-size: 18px;\">하게 !</span>\r\n"
				+ "            <br><span\r\n"
				+ "                style=\"color: orangered; font-weight: bold; font-size: 20px;\">초연결\r\n"
				+ "            </span><span style=\"font-weight: bold; color: #fff; font-size: 18px;\">\r\n"
				+ "                업무 플랫폼</span> <span\r\n"
				+ "                style=\"font-weight: bold; color: orangered; font-size: 20px;\">CollaB\r\n"
				+ "            </span><span style=\"font-weight: bold; color: #fff; font-size: 18px;\r\n"
				+ "        \">입니다.</span>\r\n" + "        </div>\r\n" + "        <br>\r\n"
				+ "        <!--  box-shadow: 0 4px 5px -2px rgba(122, 119, 119 ,0.5); -->\r\n"
				+ "        <div style=\"width: 300px; height: 320px; text-align: center; background-color: #fff; border-radius: 10px 10px 0 0; margin: 0 auto; font-family: 'Jua', sans-serif; box-shadow: 0 4px 10px 1px rgba(95, 94, 94, 0.8);\">\r\n"
				+ "            <br><br><br>    \r\n"
				+ "            <span style=\"font-size: 20px; font-weight: bold;\">회원정보</span><br><span style=\"font-size: 18px; font-weight: bold;\">"
				+ setToUserName
				+ "님 반갑습니다.</span><br><br><br><span style=\"font-size: 20px; font-weight: bold;\">초대코드</span>\r\n"
				+ "            <br>\r\n" + "            <span style=\"font-size: 18px; font-weight: bold;\">"
				+ inviteCode + "</span>\r\n"
				+ "            <hr style=\"width: 250px; font-size: 0; height: 2px; background-color: orangered; border: none;\">\r\n"
				+ "            <br><br>\r\n"
				+ "            <a href=\"http://localhost/CollaB/workspaceInviteYesChk.do?result=yes&email="
				+ user_emailconfirm
				+ "\"><span style=\"width: 80px; height: 30px; background-color:#1c87e5; display: inline-block; border-radius: 5px; line-height: 30px; color: white; font-weight: bold;\">초대 수락</span></a>\r\n"
				+ "            <a href=\"http://localhost/CollaB/workspaceInviteNoChk.do?result=no&email="
				+ user_emailconfirm
				+ "\"><span style=\"width: 80px; height: 30px; background-color:black; display: inline-block; border-radius: 5px; line-height: 30px; color: white; font-weight: bold;\">초대 거절</span></a>\r\n"
				+ "\r\n" + "        </div>\r\n" + "    </div>\r\n"
				+ "    <ul style=\"display: inline-block; margin-left: -30px\">\r\n"
				+ "        <li>초대코드를 이용하여 Workspace 가입이 가능합니다.\r\n"
				+ "            <br>입력방법 : 회원가입 시 초대코드 입력, 마이페이지 > 초대코드 입력 클릭\r\n" + "        </li>\r\n"
				+ "    </ul>\r\n" + "   \r\n" + "</body>\r\n" + "\r\n" + "</html>";
		messageHelper.setText(sb, true);

		mail.send(message);
		System.out.println("ivo : "+ivo.getInvite_code());
		System.out.println("ivo : "+ivo.getInvite_confirm());
		System.out.println("ivo : "+ivo.getUser_email());
		System.out.println("ivo : "+ivo.getUser_emailconfirm());
		System.out.println("ivo : "+ivo.getWorkspace_id());
		int inviteChk = inviteDao.inviteInsert(ivo);
		System.out.println("inviteChk : "+ inviteChk);
		if (inviteChk == 0) {
			return "false";
		} else {
			return "true";
		}

	}

	private static String getRandomString(int length) {
		StringBuffer sb = new StringBuffer();
		Random random = new Random();

		for (int i = 1; i <= length; i++) {
			sb.append((char) ((int) (random.nextInt(26)) + 65));
			if (i % 4 == 0 && i != length) {
				sb.append("-");
			}
		}
		return sb.toString();
	}

	@RequestMapping("/workspaceInviteYesChk.do")
	public void emailtest(String result, HttpServletResponse response,String email) throws IOException {
		response.setContentType("text/html; utf-8");
		PrintWriter out = response.getWriter();
		InviteVO vo = new InviteVO();
		vo.setUser_emailconfirm(email);
		vo = inviteDao.inviteEmailConfirmSelect(vo);
		String confirmChk = vo.getInvite_confirm();
		System.out.println(confirmChk);
		if(confirmChk.contains("O")) {
			out.println("<script>alert('이미 workspace에 가입되셨습니다.');</script>");
			out.flush();
			return;
		}else if(confirmChk.contains("취소")) {
			out.println("<script>alert('이미 workspace초대를 거절하셨습니다.');</script>");
			out.flush();
			return;
		}
		vo = inviteDao.inviteEmailConfirmSelect(vo);
		vo.setInvite_confirm("O");
		int updateChk = inviteDao.inviteUpdate(vo);
		WorkspaceJoinVO wjvo = new WorkspaceJoinVO();
		UserVO uvo = new UserVO();
		uvo.setEmail(vo.getUser_email());
		uvo = memberPageUserDao.memberPageUserEmailSelect(uvo);
		int mpwjChk = 0;
		if (updateChk != 0) {
			wjvo.setId(uvo.getId());
			wjvo.setWorkspace_id(vo.getWorkspace_id());
			wjvo.setPermissions("USER");
			mpwjChk = memWorkspaceJoinDao.memPageWorkspaceJoinInsert(wjvo);
		}
	
		if (mpwjChk != 0) {
			out.println("<script>alert('성공적으로 workspace에 가입되셨습니다.');</script>");
			out.println("<script>location.href='index.do'</script>");
			
		} else {
			out.println("<script>alert('시스템 에러.');</script>");

		}

		out.flush();

	}

	@RequestMapping("/workspaceInviteNoChk.do")
	public void emailtest2(String result, HttpServletResponse response, String email) throws IOException {
		response.setContentType("text/html; utf-8");
		PrintWriter out = response.getWriter();
		InviteVO vo = new InviteVO();
		vo.setUser_emailconfirm(email);
		vo = inviteDao.inviteEmailConfirmSelect(vo);
		String confirmChk = vo.getInvite_confirm();
		if(confirmChk.contains("취소")){
			out.println("<script>alert('이미 workspace초대를 거절하셨습니다.');</script>");
			out.flush();
			return;
		}else if(confirmChk.contains("O")) {
			out.println("<script>alert('이미 workspace초대가 완료되었습니다.');</script>");
			out.flush();
			return;
		}
		vo.setInvite_confirm("취소");
		int updateChk = inviteDao.inviteUpdate(vo);
		
		if (updateChk != 0) {
			out.println("<script>alert('workspace초대가 거절되었습니다.');</script>");

		} else {
			out.println("<script>alert('시스템 오류.');</script>");
		}
		out.flush();

	}
	@RequestMapping("/ajaxWorkspaceInviteInputValWorkspaceChk.do")
	@ResponseBody
	public String ajaxWorkspaceInviteInputValWorkspaceChk(WorkspaceJoinVO vo) {
		vo = memWorkspaceJoinDao.memPageWorkspaceJoinCurrentWorkspaceidUseridselect(vo);
		if(vo == null) {
			return "true";
		}else {
			return "false";
		}
	
	}
}
