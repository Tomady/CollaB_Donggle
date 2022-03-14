package co.Donggle.CollaB.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("commentDao")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentMapper map;
	
	@Override
	public List<CommentVO> commentCardIdselectResultUserNameUserNickName(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentCardIdselectResultUserNameUserNickName(vo);
	}

	@Override
	public CommentVO commentLikeUserIdSelect(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentLikeUserIdSelect(vo);
	}

	@Override
	public int commentInsert(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentInsert(vo);
	}

	@Override
	public CommentVO commentMaxGroupSelect(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentMaxGroupSelect(vo);
	}

	@Override
	public int commentFileInsert(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentFileInsert(vo);
	}

	@Override
	public List<CommentVO> commentFileSelectList() {
		// TODO Auto-generated method stub
		return map.commentFileSelectList();
	}

	@Override
	public int recommentInsert(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.recommentInsert(vo);
	}

	@Override
	public CommentVO recommentMaxOrderSelect(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.recommentMaxOrderSelect(vo);
	}

}
