package co.Donggle.CollaB.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.board.service.BoardMapper;
import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {
	@Autowired BoardMapper map;
	
	@Override
	public List<BoardVO> boardList(String id) {
		return map.boardList(id);
	}

	@Override
	public List<BoardVO> boardsList(BoardVO vo) {
		return map.boardsList(vo);
	}

	@Override
	public int boardRename(BoardVO vo) {
		return map.boardRename(vo);
	}

	@Override
	public int boardJoinDelete(BoardVO vo) {
		return map.boardJoinDelete(vo);
	}

	@Override
	public BoardVO selectBoardStar(BoardVO vo) {
		return map.selectBoardStar(vo);
	}

	@Override
	public BoardVO selectBoard(BoardVO vo) {
		return map.selectBoard(vo);
	}

	@Override
	public int changeBoardThema(BoardVO vo) {
		return map.changeBoardThema(vo);
	}

}
