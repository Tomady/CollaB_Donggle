package co.Donggle.CollaB.message.service;

import java.util.List;

public interface InboxService {
	List<InboxVO> inboxList(InboxVO vo); //받은메시지 리스트
	int inboxMsgDelete(InboxVO vo); //받은메시지 삭제
	List<InboxVO> unreadList(InboxVO vo); //안읽은메시지 리스트
	InboxVO inboxSelectMsg(InboxVO vo); //메시지 한건 조회
	int starMsg(InboxVO vo); //즐겨찾기 추가 | 해제
	int inboxMsgConfirm(InboxVO vo); //메시지 한건조회 - confirm컬럼 Y로 변경
	int inboxMsgInsert(InboxVO vo); //받은메시지 추가
	int inboxUnreadMsg(InboxVO vo); //읽지 않은 메시지 몇개인지
	List<InboxVO> inboxSearch_writer(InboxVO vo); //받은메시지 검색-보낸사람별로
	List<InboxVO> inboxSearch_title(InboxVO vo); //받은메시지 검색-제목별로
	
	List<InboxVO> inboxStarSearch_writer(InboxVO vo); //중요편지검색-보낸사람별로
	List<InboxVO> inboxStarSearch_title(InboxVO vo); //중요편지검색-제목별로
	List<InboxVO> inboxStarList(InboxVO vo); //받은메시지 중, 중요편지 리스트
}
