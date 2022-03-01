package co.Donggle.CollaB.board.service;

import java.util.List;

public interface BoardMapper {
	//사용자가 갖고 있는 보드 전부
	List<BoardVO> boardList(String id); 
	//boards페이지에서 볼 해당 워크스페이스에서 사용자의 보드 전부
	List<BoardVO> boardsList(BoardVO vo); 
	//보드이름수정
	int boardRename(BoardVO vo);
	//보드탈퇴(보드삭제아님)
	int boardJoinDelete(BoardVO vo);
	//해당워크스페이스에서 즐겨찾기한 보드목록
	List<BoardVO> selectBoardStar(BoardVO vo);
	//해당워크스페이스에서 즐겨찾기하지않은 보드목록
	List<BoardVO> selectBoardNonStar(BoardVO vo);
	//해당보드를 즐겨찾기했는지 유무
	int boardStarYesOrNo(BoardVO vo);
	//보드상세조회-해당보드정보(보드이름, 테마, 워크스페이스ID, 워크스페이스이름)
	BoardVO selectBoard(BoardVO vo);
	//보드테마변경
	int changeBoardThema(BoardVO vo);
	//워크스페이스탈퇴하면서 보드도 모두 탈퇴
	int boardJoinDrop(BoardVO vo);
	//보드생성
	int createBoard(BoardVO vo);
	//보드가입(board_join테이블에 insert)
	int insertBoardJoin(BoardVO vo);
	//방금생성한 보드 조회
	BoardVO currentBoardSelect();
	//해당보드의 워크스페이스 아이디
	int boardWorkspaceID(BoardVO vo);
	//보드 즐겨찾기 추가
	int boardAddStar(BoardVO vo);
	//보드 즐겨찾기 해제
	int boardRemoveStar(BoardVO vo);
}
