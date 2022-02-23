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

}
