package co.Donggle.CollaB.checklist.service;

import java.util.List;

public interface checklistMapper {
	
	List<checklistVO> chklistAll();
	int chklistAdd(checklistVO vo);
	int chklistDelete(int checklist_id);

}
