package co.Donggle.CollaB.mypage.web;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.Donggle.CollaB.mypage.service.MyPageServiceImpl;
import co.Donggle.CollaB.mypage.service.MyPageVO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageServiceImpl MyPageDao;
	
	@Autowired
	String saveDirectory;
	
		// 마이페이지 메인 페이지
		@RequestMapping("/myPageMain")
		public String myPageMain(MyPageVO vo, HttpSession session, Model model) {
			//String id = (String) session.getAttribute("id");
			String id = "user6";
			vo.setId(id);
			model.addAttribute("user_info", MyPageDao.userSelect(vo) );
			return "myPage/myPageMain";
		}
		
		// 마이페이지 프로필 수정 페이지
		@RequestMapping("/myProfile")
		public String myProfile(MyPageVO vo, HttpSession session, Model model) {
			// String id = (String) session.getAttribute("id");
			String id = "user6";
			vo.setId(id);
			model.addAttribute("user_info", MyPageDao.userSelect(vo) );
			return "myPage/myProfile";
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
//				try {
//					FileCopyUtils.copy(file.getBytes(), target); // 저장
				file.transferTo(target);
//				} catch(Exception e) {
//					e.printStackTrace();
//				}
			}
			
			MyPageDao.updateProfile(vo); // 데이터 저장
			return "redirect:myPageMain";
			
		}
		
		// 마이페이지 정보 수정 페이지
		@RequestMapping("/myInfo")
		public String myInfo(MyPageVO vo, HttpSession session, Model model) {
			// String id = (String) session.getAttribute("id");
			String id = "user6";
			vo.setId(id);
			model.addAttribute("user_info", MyPageDao.userSelect(vo) );
			return "myPage/myInfo";
		}
		
		// 마이페이지 정보 수정 처리
		@PostMapping("/myInfoUpdate")
		public String myInfoUpdate(MyPageVO vo) {
			int r = MyPageDao.updateInfo(vo);
			if(r>0) {
				return "redirect:myPageMain";
			} else {
				return "redirect:myInfo";
			}			
		}
		
		// 마이페이지 비밀번호 변경 페이지
		@RequestMapping("/newPw")
		public String newPw(MyPageVO vo, HttpSession session, Model model) {
			// String id = (String) session.getAttribute("id");
			String id = "user6";
			vo.setId(id);
			model.addAttribute("user_info", MyPageDao.userSelect(vo) );
			return "myPage/newPw";
		}
		
		// 마이페이지 비밀번호 변경 처리
		@PostMapping("/pwUpdate")
		public String pwUpdate(MyPageVO vo) {
			int r = MyPageDao.updatePw(vo);
			if(r>0) {
				return "redirect:myPageMain";
			} else {
				return "redirect:newPw";
			}	
		}
		
		// 회원탈퇴 페이지
		@RequestMapping("/withdrawal")
		public String withdrawal() {
			return "myPage/withdrawal";
		}
		
		// 회원탈퇴처리
		@RequestMapping("/userDelete")
		@ResponseBody
		public String userDelete(MyPageVO vo, HttpSession session) {
			String result = "N";
			// String id = (String) session.getAttribute("id");
			String id = "user7";
			vo.setId(id);
			int r = MyPageDao.deleteUser(vo);
			if(r>0) {
				session.invalidate();
				result = "Y";
			}
			return result;
		}

}
