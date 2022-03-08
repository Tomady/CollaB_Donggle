package co.Donggle.CollaB.mypage.service;

public interface MyPageService {
	
	MyPageVO userSelect(MyPageVO vo); // 회원정보
	int updateProfile(MyPageVO vo); // 프로필 수정
	int updateInfo(MyPageVO vo); // 정보 수정
	int updatePw(MyPageVO vo); // 비밀번호 수정
	int deleteUser(MyPageVO vo); // 탈퇴

}
