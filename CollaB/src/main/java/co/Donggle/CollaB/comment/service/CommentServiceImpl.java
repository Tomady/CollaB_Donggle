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

	@Override
	public CommentVO commentGoodSelect(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentGoodSelect(vo);
	}

	@Override
	public int commentGoodInsert(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentGoodInsert(vo);
	}

	@Override
	public int commentGoodDelete(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentGoodDelete(vo);
	}

	@Override
	public int commentBadInsert(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentBadInsert(vo);
	}

	@Override
	public CommentVO commentBadSelect(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentBadSelect(vo);
	}

	@Override
	public int commentBadDelete(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentBadDelete(vo);
	}

	@Override
	public CommentVO commentGoodSelectSum(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentGoodSelectSum(vo);
	}

	@Override
	public CommentVO commentBadSelectSum(CommentVO vo) {
		// TODO Auto-generated method stub
		return map.commentBadSelectSum(vo);
	}

	



	

}
