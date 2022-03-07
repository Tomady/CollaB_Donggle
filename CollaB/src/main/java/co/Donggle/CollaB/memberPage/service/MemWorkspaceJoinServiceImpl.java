package co.Donggle.CollaB.memberPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.workspace.service.WorkspaceJoinVO;
@Repository("memWorkspaceJoinDao")
public class MemWorkspaceJoinServiceImpl implements MemWorkspaceJoinService {

	@Autowired
	private MemWorkspaceJoinMapper map;
	
	@Override
	public List<WorkspaceJoinVO> workspaceJoinIdselect(WorkspaceJoinVO vo) {
		// TODO Auto-generated method stub
		return map.workspaceJoinIdselect(vo);
	}

}
