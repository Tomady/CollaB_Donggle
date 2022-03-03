package co.Donggle.CollaB.workspace.service;

public interface WorkspaceService {
	int workspaceInsert(WorkspaceVO vo);
	int workspaceRename(WorkspaceVO vo);
	WorkspaceVO searchWorkspace(WorkspaceVO vo);
	//방금 생성된 워크스페이스의 workspaceId구하기 => 메인헤더에서 필요
	//메인헤더에서 워크스페이스 생성하고 바로 해당 워크스페이스 boards페이지로 가기위해
	int selectWorkspaceMaxId(); 
	
}
