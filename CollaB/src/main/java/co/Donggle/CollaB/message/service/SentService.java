package co.Donggle.CollaB.message.service;

import java.util.List;

public interface SentService {
	int sentMsgInsert(SentVO vo); //보낸메시지 추가
	List<SentVO> sentMsgList(SentVO vo); //보낸메시지 리스트
	int sentMsgDelete(SentVO vo); //보낸메시지 삭제
	SentVO sentMsgSelect(SentVO vo); //보낸메시지 한건조회
	int sentMsgStar(SentVO vo); //보낸메시지 즐겨찾기처리
	
	List<SentVO> sentSearch_to(SentVO vo); //보낸메시지 검색-받는사람별로
	List<SentVO> sentSearch_title(SentVO vo); //보낸메시지 검색-제목별로
	
}
