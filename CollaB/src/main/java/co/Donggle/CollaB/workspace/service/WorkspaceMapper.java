package co.Donggle.CollaB.workspace.service;

import java.util.List;

import co.Donggle.CollaB.board.service.BoardVO;

public interface WorkspaceMapper {
	int workspaceInsert(WorkspaceVO vo);
	int workspaceRename(WorkspaceVO vo);
	WorkspaceVO searchWorkspace(WorkspaceVO vo);
	//방금 생성된 워크스페이스의 workspaceId구하기 => 메인헤더에서 필요
	//메인헤더에서 워크스페이스 생성하고 바로 해당 워크스페이스 boards페이지로 가기위해
	int selectWorkspaceMaxId(); 
	//해당 워크스페이스가 가지고 있는 모든 보드목록
	List<BoardVO> boardListinWorkspace(WorkspaceVO vo);
	
	//워크스페이스 삭제 - 해당 워크스페이스가 가지고 있는 모든 보드 아이디 목록
	List<BoardVO> boardIdListInWorkspace(WorkspaceVO vo);
	//워크스페이스 삭제
	int workspaceDelete(WorkspaceVO vo);
}
