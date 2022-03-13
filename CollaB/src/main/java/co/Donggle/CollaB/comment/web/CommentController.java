package co.Donggle.CollaB.comment.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.comment.service.CommentService;
import co.Donggle.CollaB.comment.service.CommentVO;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentDao;

	@Autowired
	String commentRelativeSaveDirectory;
	
	@RequestMapping("/comment.do")
	public String comment(Model model) {
		model.addAttribute("card_id", 2);
		return "comment";
	}

	@RequestMapping("/ajaxCardIdSelect.do")
	@ResponseBody
	public List<CommentVO> ajaxCardIdSelect(CommentVO vo) {
		return commentDao.commentCardIdselectResultUserNameUserNickName(vo);
	}
	
	@RequestMapping("/ajaxComment_likeSelect.do")
	@ResponseBody
	public CommentVO ajaxComment_likeSelect(CommentVO vo) {
		vo = commentDao.commentLikeUserIdSelect(vo);
		if(vo == null) {
			return null;
		}else {
			return vo;
		}
		
		 
	}
	
	@RequestMapping("/ajaxCommentCreate.do")
	@ResponseBody
	public String ajaxCommentCreate(CommentVO vo) {
		
		int chk = commentDao.commentInsert(vo);
		if(chk == 0) {
			return "false";
		}else {
			return "true";
		}
	}
}
