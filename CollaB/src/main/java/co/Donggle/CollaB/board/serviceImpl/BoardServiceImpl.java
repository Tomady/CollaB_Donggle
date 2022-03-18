package co.Donggle.CollaB.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.board.service.BoardMapper;
import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.list.service.ListVO;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

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
	public List<BoardVO> selectBoardStar(BoardVO vo) {
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

	@Override
	public int boardJoinDrop(BoardVO vo) {
		return map.boardJoinDrop(vo);
	}

	@Override
	public int createBoard(BoardVO vo) {
		return map.createBoard(vo);
	}

	@Override
	public int insertBoardJoin(BoardVO vo) {
		return map.insertBoardJoin(vo);
	}

	@Override
	public BoardVO currentBoardSelect() {
		return map.currentBoardSelect();
	}

	@Override
	public int boardWorkspaceID(BoardVO vo) {
		return map.boardWorkspaceID(vo);
	}

	@Override
	public List<BoardVO> selectBoardNonStar(BoardVO vo) {
		return map.selectBoardNonStar(vo);
	}

	@Override
	public int boardStarYesOrNo(BoardVO vo) {
		return map.boardStarYesOrNo(vo);
	}

	@Override
	public int boardAddStar(BoardVO vo) {
		return map.boardAddStar(vo);
	}

	@Override
	public int boardRemoveStar(BoardVO vo) {
		return map.boardRemoveStar(vo);
	}

	@Override
	public int addBoardJoinMember(BoardVO vo) {
		return map.addBoardJoinMember(vo);
	}

	@Override
	public int selectBoardId(ListVO vo) {
		return map.selectBoardId(vo);
	}

	@Override
	public List<ListVO> listIdInBoard(BoardVO vo) {
		return map.listIdInBoard(vo);
	}

	@Override
	public int deleteBoards(WorkspaceVO vo) {
		return map.deleteBoards(vo);
	}

	@Override
	public int deleteBoardStars(BoardVO vo) {
		return map.deleteBoardStars(vo);
	}

	@Override
	public int deleteBoardJoinAll(BoardVO vo) {
		return map.deleteBoardJoinAll(vo);
	}

	@Override
	public int deleteBoardstar(BoardVO vo) {
		return map.deleteBoardstar(vo);
	}

	@Override
	public int boardJoinCount(BoardVO vo) {
		return map.boardJoinCount(vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		return map.boardDelete(vo);
	}

	@Override
	public List<BoardVO> boardNameSearch(BoardVO vo) {
		return map.boardNameSearch(vo);
	}

}
