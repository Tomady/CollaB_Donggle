package co.Donggle.CollaB.workspace.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.user.service.UserVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinMapper;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinVO;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Repository("workspaceJoinDao")
public class WorkspaceJoinServiceImpl implements WorkspaceJoinService {
	@Autowired
	private WorkspaceJoinMapper map;
	
	@Override
	public List<WorkspaceVO> workspaceJoinList(String id) {
		return map.workspaceJoinList(id);
	}

	@Override
	public int workspaceJoinCount(String id) {
		return map.workspaceJoinCount(id);
	}

	@Override
	public int workspaceJoinInsert(WorkspaceJoinVO vo) {
		return map.workspaceJoinInsert(vo);
	}

	@Override
	public List<UserVO> workspaceTotalMember(WorkspaceJoinVO vo) {
		return map.workspaceTotalMember(vo);
	}

}