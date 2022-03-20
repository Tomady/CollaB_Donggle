package co.Donggle.CollaB.fileHistory.web;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.fileHistory.service.FileHistoryMapper;
import co.Donggle.CollaB.fileHistory.service.VuFilehistory;
import co.Donggle.CollaB.fileinfo.service.FileInfoVO;
import co.Donggle.CollaB.recent.service.RecentService;
import co.Donggle.CollaB.recent.service.RecentVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class FileHIstoryController {
	@Autowired
	WorkspaceJoinService workspaceJoinDao;
	@Autowired
	WorkspaceService workspaceDao;
	@Autowired
	BoardService boardDao;
	@Autowired
	FileHistoryMapper fileDao;
	@Autowired
	RecentService RecentDao;
	@Autowired
	String cardSaveDirectory;

	@RequestMapping("/filehistory")
	public String fileHistory(WorkspaceVO wkvo, Model model, HttpSession session, BoardVO vo) {
		String userId = (String) session.getAttribute("id");
		int workspaceid = (int) session.getAttribute("enterWorkspaceId");

		vo.setId(userId);

		// recent
		RecentVO recentvo = new RecentVO();
		recentvo.setId(userId);
		List<RecentVO> recents = new ArrayList<RecentVO>();
		recents = RecentDao.recentBoard(recentvo);

		// 메뉴헤더
		model.addAttribute("workspace", workspaceDao.searchWorkspace(wkvo));
		model.addAttribute("workspaceList", workspaceJoinDao.workspaceJoinList(userId));
		model.addAttribute("boardStar", boardDao.selectBoardStar(vo));
		model.addAttribute("unStarBoards", boardDao.selectBoardNonStar(vo));

		// 파일 히스토리
		model.addAttribute("filehistory", fileDao.fileCardList(workspaceid));
		model.addAttribute("fileInfoList", fileDao.fileInfoList(workspaceid));

		// recent
		model.addAttribute("recents", recents);

		return "fileHistory/fileHistory";
	}

	// 카드 첨부파일 다운로드
	@RequestMapping("/fileDownLoad")
	public void historyFileDownload(VuFilehistory vo, HttpServletResponse response) throws Exception {
		try {
			String path = cardSaveDirectory + vo.getPfile_name();

			// File file = new File(path);
			response.setHeader("Content-Disposition", "attachment;filename=" + vo.getFile_name());

			FileInputStream fileInputStream = new FileInputStream(path);
			OutputStream out = response.getOutputStream();

			int read = 0;
			byte[] buffer = new byte[1024];
			while ((read = fileInputStream.read(buffer)) != -1) {
				out.write(buffer, 0, read);
			}

		} catch (Exception e) {
			throw new Exception("download error");
		}
	}
}
