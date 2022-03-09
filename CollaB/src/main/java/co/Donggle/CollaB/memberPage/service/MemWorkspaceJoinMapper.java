package co.Donggle.CollaB.memberPage.service;

import java.util.List;

import co.Donggle.CollaB.workspace.service.WorkspaceJoinVO;

public interface MemWorkspaceJoinMapper {
	List<WorkspaceJoinVO> memPageWorkspaceJoinIdselect(WorkspaceJoinVO vo); // 한 워크스페이스에 있는 멤버리스트
	WorkspaceJoinVO memPageWorkspaceJoinCurrentWorkspaceidUseridselect(WorkspaceJoinVO vo);
	int memPageWorkspaceJoinPermissionUpdate(WorkspaceJoinVO vo);

}
