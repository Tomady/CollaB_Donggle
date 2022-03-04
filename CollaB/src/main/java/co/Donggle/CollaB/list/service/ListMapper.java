package co.Donggle.CollaB.list.service;

import java.util.List;

import co.Donggle.CollaB.card.service.CardVO;

public interface ListMapper {
	//리스트 생성
	int insertList(ListVO vo);
	//방금 만든 리스트 조회
	ListVO selectCurrentList();
	//해당 보드의 리스트 전부
	List<ListVO> selectTotalList(ListVO vo);
	//해당 보드의 카드 전부
	List<ListVO> selectTotalCard(ListVO vo);
	//리스트 이름변경
	int renameList(ListVO vo);
	
	//=====리스트 삭제=====
	//해당 리스트 안에 들어있는 카드 아이디 목록 가져오기
	List<CardVO> selectCardIds(ListVO vo);
	//리스트 삭제
	int deleteList(ListVO vo);
}
