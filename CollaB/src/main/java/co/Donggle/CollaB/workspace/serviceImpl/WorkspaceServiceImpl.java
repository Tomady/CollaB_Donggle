package co.Donggle.CollaB.workspace.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.workspace.service.WorkspaceMapper;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Repository("workspaceDao")
public class WorkspaceServiceImpl implements WorkspaceService {
	@Autowired
	private WorkspaceMapper map;
	
	@Override
	public int workspaceInsert(WorkspaceVO vo) {
		return map.workspaceInsert(vo);
	}

	@Override
	public int workspaceRename(WorkspaceVO vo) {
		return map.workspaceRename(vo);
	}

	@Override
	public WorkspaceVO searchWorkspace(WorkspaceVO vo) {
		return map.searchWorkspace(vo);
	}

	@Override
	public int selectWorkspaceMaxId() {
		return map.selectWorkspaceMaxId();
	}

}
