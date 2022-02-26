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
	//보드즐겨찾기유무
	BoardVO selectBoardStar(BoardVO vo);
	//보드상세조회-해당보드정보(보드이름, 테마, 워크스페이스ID, 워크스페이스이름)
	BoardVO selectBoard(BoardVO vo);
	//보드테마변경
	int changeBoardThema(BoardVO vo);
}
