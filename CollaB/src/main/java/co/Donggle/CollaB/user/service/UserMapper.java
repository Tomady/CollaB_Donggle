package co.Donggle.CollaB.user.service;

import java.util.List;

import co.Donggle.CollaB.board.service.BoardVO;

public interface UserMapper {
	//같은 워크스페이스를 사용하는 멤버목록-아이디,이름,닉네임,비밀번호,이메일,프로필이미지,연락처,회사,토큰,권한
	List<UserVO> workspaceJoinMembers(BoardVO vo);
	//같은 보드를 사용하는 멤버목록-아이디,이름,닉네임,비번,이메일,프로필사진,전화번호,회사,토큰,워크스페이스아이디,보드아이디
	List<UserVO> boardJoinMembers(BoardVO vo);
	//해당워크스페이스멤버 - 해당보드멤버 = 같은워크스페이스 사용하지만 해당 보드에는 없는사람
	List<UserVO> outsideBoardMembers(BoardVO vo);
}
