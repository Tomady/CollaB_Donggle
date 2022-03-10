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

}
