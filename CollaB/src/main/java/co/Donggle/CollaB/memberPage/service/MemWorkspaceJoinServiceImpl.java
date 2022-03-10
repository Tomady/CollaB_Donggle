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
	public List<WorkspaceJoinVO> memPageWorkspaceJoinIdselect(WorkspaceJoinVO vo) {
		// TODO Auto-generated method stub
		return map.memPageWorkspaceJoinIdselect(vo);
	}

	@Override
	public WorkspaceJoinVO memPageWorkspaceJoinCurrentWorkspaceidUseridselect(WorkspaceJoinVO vo) {
		// TODO Auto-generated method stub
		return map.memPageWorkspaceJoinCurrentWorkspaceidUseridselect(vo);
	}

	@Override
	public int memPageWorkspaceJoinPermissionUpdate(WorkspaceJoinVO vo) {
		// TODO Auto-generated method stub
		return map.memPageWorkspaceJoinPermissionUpdate(vo);
	}

	@Override
	public int memPageWorkspaceJoinInsert(WorkspaceJoinVO vo) {
		// TODO Auto-generated method stub
		return map.memPageWorkspaceJoinInsert(vo);
	}




}
