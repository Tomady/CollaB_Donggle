package co.Donggle.CollaB.comment.service;

import java.util.List;

public interface CommentService {
	List<CommentVO> commentCardIdselectResultUserNameUserNickName(CommentVO vo);
	CommentVO commentLikeUserIdSelect(CommentVO vo);
	int commentInsert(CommentVO vo);
	CommentVO commentMaxGroupSelect(CommentVO vo);
	int commentFileInsert(CommentVO vo);
	List<CommentVO> commentFileSelectList();
	int recommentInsert(CommentVO vo);
	CommentVO recommentMaxOrderSelect(CommentVO vo);
	CommentVO commentGoodSelect(CommentVO vo);
	int commentGoodInsert(CommentVO vo);
	int commentGoodDelete(CommentVO vo);
	int commentBadInsert(CommentVO vo);
	CommentVO commentBadSelect(CommentVO vo);
	int commentBadDelete(CommentVO vo);
	CommentVO commentGoodSelectSum(CommentVO vo);
	CommentVO commentBadSelectSum(CommentVO vo);
	int commentDelete(CommentVO vo);
	int commentFileDelete(CommentVO vo);
	List<CommentVO> commentGroupListSelect(CommentVO vo);
	int commentUpdate(CommentVO vo);
	int commentFileUpdate(CommentVO vo);
}
