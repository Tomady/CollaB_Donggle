package co.Donggle.CollaB.checklist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int modifyitemyn(itemInfoVO vo) {
		return itemInfoMapper.modifyitemyn(vo);
	}

	@Override
	public int deleteitem(int item_id) {
		return itemInfoMapper.deleteitem(item_id);
	}

}
