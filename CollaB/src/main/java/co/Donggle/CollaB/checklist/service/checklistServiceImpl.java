package co.Donggle.CollaB.checklist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.card.service.CardVO;

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
	public List<CardVO> totalCheckList(CardVO vo) {
		return checklistMapper.totalCheckList(vo);
	}

	@Override
	public int chklistDelete(CardVO vo) {
		return checklistMapper.chklistDelete(vo);
	}
}
