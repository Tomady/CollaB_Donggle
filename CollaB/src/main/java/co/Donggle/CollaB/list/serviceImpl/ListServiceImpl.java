package co.Donggle.CollaB.list.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.list.service.ListMapper;
import co.Donggle.CollaB.list.service.ListService;
import co.Donggle.CollaB.list.service.ListVO;

@Repository("listDao")
public class ListServiceImpl implements ListService {
	
	@Autowired
	private ListMapper map;
	
	@Override
	public int insertList(ListVO vo) {
		return map.insertList(vo);
	}

	@Override
	public ListVO selectCurrentList() {
		return map.selectCurrentList();
	}

	@Override
	public List<ListVO> selectTotalList(ListVO vo) {
		return map.selectTotalList(vo);
	}

	@Override
	public List<ListVO> selectTotalCard(ListVO vo) {
		return map.selectTotalCard(vo);
	}

}
