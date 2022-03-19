package co.Donggle.CollaB.mypage.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.Donggle.CollaB.mypage.service.MyPageVO;
import co.Donggle.CollaB.mypage.serviceImpl.MyPageServiceImpl;
import co.Donggle.CollaB.recent.service.RecentService;
import co.Donggle.CollaB.recent.service.RecentVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;

@Controller
public class MyPageController {
	@Autowired WorkspaceJoinService workspaceJoinDao;
	@Autowired private MyPageServiceImpl MypageDao;
	@Autowired RecentService RecentDao;
	
	@Autowired 
	String saveDirectory;
	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
			// 마이페이지 메인 페이지
			@RequestMapping("/myPageMain")
			public String myPageMain(MyPageVO vo, HttpSession session, Model model) {
				String id = (String) session.getAttribute("id");
				vo.setId(id);
				
				// recent
				RecentVO recentvo = new RecentVO();
				recentvo.setId(id);
				List<RecentVO> recents = new ArrayList<RecentVO>();
				recents = RecentDao.recentBoard(recentvo);
				
				model.addAttribute("user_info", MypageDao.userSelect(vo) );
				model.addAttribute("myWorkspaceList",workspaceJoinDao.workspaceJoinList(id));
				model.addAttribute("recents", recents);

				return "myPageMain";
			}
			
			// 마이페이지 프로필 수정 페이지
			@RequestMapping("/myProfile")
			public String myProfile(MyPageVO vo, HttpSession session, Model model) {
				String id = (String) session.getAttribute("id");
				vo.setId(id);
				
				// recent
				RecentVO recentvo = new RecentVO();
				recentvo.setId(id);
				List<RecentVO> recents = new ArrayList<RecentVO>();
				recents = RecentDao.recentBoard(recentvo);
				
				model.addAttribute("user_info", MypageDao.userSelect(vo) );
				model.addAttribute("myWorkspaceList",workspaceJoinDao.workspaceJoinList(id));
				model.addAttribute("recents", recents);

				return "myProfile";
			}
			
			// 마이페이지 프로필 수정 처리
			@PostMapping("/myProfileUpdate")
			public String myProfileUpdate(MyPageVO vo, MultipartFile file) throws IOException {
				
				if(file != null && file.getSize() > 0) {
					
					String profPic = file.getOriginalFilename(); // 파일명
					String saveProfPic = saveDirectory + UUID.randomUUID().toString(); // 물리파일명
					saveProfPic = saveProfPic + profPic.substring(profPic.lastIndexOf("."));
					File target = new File(saveDirectory, profPic);
					vo.setProf_pic(saveProfPic);
					
					// 경로 생성
					if(! new File(saveDirectory).exists()) { // 존재하지 않으면 true, 그 외는 false 
						new File(saveDirectory).mkdir();
					}
					
					// 파일 복사
					file.transferTo(target);
				}
				
				MypageDao.updateProfile(vo); // 데이터 저장
				return "redirect:myPageMain";
				
			}
			
			// 마이페이지 정보 수정 페이지
			@RequestMapping("/myInfo")
			public String myInfo(MyPageVO vo, HttpSession session, Model model) {
				String id = (String) session.getAttribute("id");
				vo.setId(id);
				
				// recent
				RecentVO recentvo = new RecentVO();
				recentvo.setId(id);
				List<RecentVO> recents = new ArrayList<RecentVO>();
				recents = RecentDao.recentBoard(recentvo);
				
				model.addAttribute("user_info", MypageDao.userSelect(vo) );
				model.addAttribute("myWorkspaceList",workspaceJoinDao.workspaceJoinList(id));
				model.addAttribute("recents", recents);

				return "myInfo";
			}
			
			// 마이페이지 정보 수정 처리
			@PostMapping("/myInfoUpdate")
			public String myInfoUpdate(MyPageVO vo) {
				int r = MypageDao.updateInfo(vo);
				if(r>0) {
					return "redirect:myPageMain";
				} else {
					return "redirect:myInfo";
				}			
			}
			
			// 마이페이지 비밀번호 변경 페이지
			@RequestMapping("/newPw")
			public String newPw(MyPageVO vo, HttpSession session, Model model) {
				String id = (String) session.getAttribute("id");
				vo.setId(id);
				
				// recent
				RecentVO recentvo = new RecentVO();
				recentvo.setId(id);
				List<RecentVO> recents = new ArrayList<RecentVO>();
				recents = RecentDao.recentBoard(recentvo);
				
				model.addAttribute("user_info", MypageDao.userSelect(vo) );
				model.addAttribute("myWorkspaceList",workspaceJoinDao.workspaceJoinList(id));
				model.addAttribute("recents", recents);

				return "newPw";
			}
			
			// 마이페이지 비밀번호 변경 처리
			//@RequestMapping
			@PostMapping("/pwUpdate")
			public String pwUpdate(MyPageVO vo) {
				String securePw = pwEncoder.encode(vo.getPassword());
				vo.setPassword(securePw);
				int r = MypageDao.updatePw(vo);
				if(r>0) {
					return "redirect:myPageMain";
				} else {
					return "redirect:newPw";
				}	
			}
			
			// 회원탈퇴 페이지
			@RequestMapping("/withdrawal")
			public String withdrawal(Model model, HttpSession session) {
				
				String userId = (String) session.getAttribute("id");

				// recent
				RecentVO recentvo = new RecentVO();
				recentvo.setId(userId);
				List<RecentVO> recents = new ArrayList<RecentVO>();
				recents = RecentDao.recentBoard(recentvo);
				
				model.addAttribute("recents", recents);
				return "withdrawal";
			}
			
			// 회원탈퇴처리
			@RequestMapping("/userDelete")
			@ResponseBody
			public String userDelete(MyPageVO vo, HttpSession session) {
				String result = "N";
				String id = (String) session.getAttribute("id");
				vo.setId(id);
				int r = MypageDao.deleteUser(vo);
				if(r>0) {
					session.invalidate();
					result = "Y";
				}
				return result;
			}
			
			// 비밀번호 확인 처리
			@PostMapping("/pwCheck")
			@ResponseBody
			public String pwCheck(MyPageVO vo, HttpSession session) {
				String result = "N";
				vo.setId((String)session.getAttribute("id"));
				
				String pw = vo.getPassword();
				vo.setPassword(pw);
				MyPageVO returnVO = MypageDao.userSelect(vo);				
				
				if(pwEncoder.matches(pw, returnVO.getPassword())) {
					result = "Y";
				}
							
				return result;
			}
}
