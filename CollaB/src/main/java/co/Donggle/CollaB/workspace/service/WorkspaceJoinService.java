package co.Donggle.CollaB.workspace.service;

import java.util.List;

public interface WorkspaceJoinService {
	List<WorkspaceVO> workspaceJoinList(String id);
	int workspaceJoinCount(String id);
	int workspaceJoinInsert(WorkspaceJoinVO vo);
}
