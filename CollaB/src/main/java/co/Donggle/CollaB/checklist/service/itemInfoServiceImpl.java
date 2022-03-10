package co.Donggle.CollaB.checklist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.card.service.CardVO;

@Repository("itemInfoDao")
public class itemInfoServiceImpl implements itemInfoService {
	
	@Autowired
	itemInfoMapper itemInfoMapper;

	@Override
	public List<itemInfoVO> itemList() {
		return itemInfoMapper.itemList();
	}

	@Override
	public int additem(itemInfoVO vo) {
		return itemInfoMapper.additem(vo);
	}

	@Override
	public int modifyitem(itemInfoVO vo) {
		return itemInfoMapper.modifyitem(vo);
	}

	@Override
	public int deleteitem(itemInfoVO vo) {
		return itemInfoMapper.deleteitem(vo);
	}

	@Override
	public List<CardVO> selectedCardItemList() {
		return itemInfoMapper.selectedCardItemList();
	}

	@Override
	public int deleteItemAll(CardVO vo) {
		return itemInfoMapper.deleteItemAll(vo);
	}

	@Override
	public int modifyitemyn(CardVO vo) {
		return itemInfoMapper.modifyitemyn(vo);
	}

	@Override
	public itemInfoVO selectItem(itemInfoVO vo) {
		return itemInfoMapper.selectItem(vo);
	}

	@Override
	public int itemInfoTotalCnt(int boardId) {
		return itemInfoMapper.itemInfoTotalCnt(boardId);
	}

	@Override
	public int itemInfoYesState(int boardId) {
		return itemInfoMapper.itemInfoYesState(boardId);
	}

}
