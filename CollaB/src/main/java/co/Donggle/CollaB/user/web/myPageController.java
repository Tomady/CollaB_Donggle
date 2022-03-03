package co.Donggle.CollaB.user.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myPageController {
	
	// 마이페이지 메인 페이지
	@RequestMapping("/myPageMain.do")
	public String myPageMain() {
		return "myPage/myPageMain";
	}
	
	// 마이페이지 프로필 수정 페이지
	@RequestMapping("/myProfile.do")
	public String myProfile() {
		return "myPage/myProfile";
	}
	
	// 마이페이지 정보 수정 페이지
	@RequestMapping("/myInfo.do")
	public String myInfo() {
		return "myPage/myInfo";
	}
	
	// 마이페이지 비밀번호 변경 페이지
	@RequestMapping("/newPw.do")
	public String newPw() {
		return "myPage/newPw";
	}
	
	// 회원탈퇴 페이지
	@RequestMapping("/withdrawal")
	public String withdrawal() {
		return "myPage/withdrawal";
	}

}
