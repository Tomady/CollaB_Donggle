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
	public int deleteitem(int item_id) {
		return itemInfoMapper.deleteitem(item_id);
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

}
