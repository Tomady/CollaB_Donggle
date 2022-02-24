package co.Donggle.CollaB.checklist.service;

import java.util.List;

public interface checklistService {
	
	List<checklistVO> chklistAll(); // 체크리스트 목록
	int chklistAdd(checklistVO vo); // 체크리스트 추가
	int chklistDelete(int checklist_id); // 체크리스트 전체 삭제

}
