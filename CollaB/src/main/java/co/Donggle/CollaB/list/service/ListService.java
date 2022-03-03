package co.Donggle.CollaB.list.service;

import java.util.List;

public interface ListService {
	//리스트 생성
	int insertList(ListVO vo);
	//방금 만든 리스트 조회
	ListVO selectCurrentList();
	//해당 보드의 리스트 전부
	List<ListVO> selectTotalList(ListVO vo);
	//해당 보드의 카드 전부
	List<ListVO> selectTotalCard(ListVO vo);
}
