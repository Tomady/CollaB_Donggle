package co.Donggle.CollaB.comment.service;

import java.util.List;

public interface CommentService {
	List<CommentVO> commentCardIdselectResultUserNameUserNickName(CommentVO vo);
	CommentVO commentLikeUserIdSelect(CommentVO vo);
	int commentInsert(CommentVO vo);
}
