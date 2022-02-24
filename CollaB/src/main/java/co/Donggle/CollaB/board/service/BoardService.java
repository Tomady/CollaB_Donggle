package co.Donggle.CollaB.board.service;

import java.util.List;

public interface BoardService {
	List<BoardVO> boardList(String id);
	List<BoardVO> boardsList(BoardVO vo);
	int boardRename(BoardVO vo);
	int boardJoinDelete(BoardVO vo);
	BoardVO selectBoardStar(BoardVO vo);
}
