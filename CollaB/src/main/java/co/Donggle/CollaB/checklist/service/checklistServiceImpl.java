package co.Donggle.CollaB.checklist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("checklistDao")
public class checklistServiceImpl implements checklistService {
	
	@Autowired
	checklistMapper checklistMapper;

	@Override
	public List<checklistVO> chklistAll() {
		return checklistMapper.chklistAll();
	}

	@Override
	public int chklistAdd(checklistVO vo) {
		return checklistMapper.chklistAdd(vo);
	}

	@Override
	public int chklistDelete(int checklist_id) {
		return checklistMapper.chklistDelete(checklist_id); 
	}

}
