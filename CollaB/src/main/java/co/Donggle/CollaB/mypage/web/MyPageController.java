package co.Donggle.CollaB.mypage.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.mypage.service.MyPageServiceImpl;
import co.Donggle.CollaB.mypage.service.MyPageVO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageServiceImpl MyPageDao;
	
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
		@RequestMapping("/myProfileUpdate")
		public String myProfileUpdate(MyPageVO vo) {
			return "";
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
				return "redirect:myInfoUpdate";
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
				return "redirect:pwUpdate";
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
