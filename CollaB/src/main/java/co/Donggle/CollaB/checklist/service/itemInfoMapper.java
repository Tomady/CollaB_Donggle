package co.Donggle.CollaB.checklist.service;

import java.util.List;

public interface itemInfoMapper {
	
	List<itemInfoVO> itemList(); // 아이템 리스트
	int additem(itemInfoVO vo); // 아이템 추가하기
	int modifyitem(itemInfoVO vo); // 아이템 수정하기
	int modifyitemyn(itemInfoVO vo); // 체크여부 수정하기
	int deleteitem(int item_id); // 아이템 삭제하기
	
}
