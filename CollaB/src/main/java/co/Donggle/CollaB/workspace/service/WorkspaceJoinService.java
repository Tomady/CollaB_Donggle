package co.Donggle.CollaB.workspace.service;

import java.util.List;

import co.Donggle.CollaB.user.service.UserVO;

public interface WorkspaceJoinService {
	//사용자의 워크스페이스 전부 - 워크스페이스ID, 워크스페이스이름, 워크스페이스 생성일
	List<WorkspaceVO> workspaceJoinList(String id);
	//사용자가 워크스페이스를 하나이상이라도 가지고 있는지 확인
	int workspaceJoinCount(String id);
	//워크스페이스 생성
	int workspaceJoinInsert(WorkspaceJoinVO vo);
	//해당 워크스페이스에 있는 모든 멤버리스트
	List<UserVO> workspaceTotalMember(WorkspaceJoinVO vo);
}
