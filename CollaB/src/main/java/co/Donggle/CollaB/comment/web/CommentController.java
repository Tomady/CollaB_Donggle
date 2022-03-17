package co.Donggle.CollaB.comment.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	
	@RequestMapping("/ajaxCommentInsert.do")
	@ResponseBody
	public String ajaxCommentInsert(CommentVO vo) {
		
		int chk = commentDao.commentInsert(vo);
		if(chk == 0) {
			return "false";
		}else {
			return "true";
		}
	}
	
	@RequestMapping("/ajaxRecommentInsert.do")
	@ResponseBody
	public CommentVO ajaxRecommentInsert(CommentVO vo) {
		vo.setComment_class(1);
		int chk = commentDao.recommentInsert(vo);
		if(chk==0) {
			return null;
		}else {
			return vo;
		}
	}
	

	
	
	@RequestMapping("/ajaxCommentMaxGroup.do")
	@ResponseBody
	public int ajaxCommentMaxGroup(CommentVO vo) {
		vo = commentDao.commentMaxGroupSelect(vo);
		return vo.getComment_group();
		
	}
	
	@RequestMapping(value = "/ajaxGetSessionUserNickname.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxGetSessionUserNickname(HttpSession session) {
		String nickname = (String) session.getAttribute("nickname");
		System.out.println(nickname);
		return nickname;
	}
	
	@RequestMapping(value = "/ajaxGetSessionUserId.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxGetSessionUserId(HttpSession session) {
		String userId = (String) session.getAttribute("id");
		return userId;
	}
	
	@RequestMapping("/ajaxCommentFileInsert.do")
	@ResponseBody
	public CommentVO ajaxCommentFileInsert(CommentVO vo, MultipartFile file) {
		
		String fileName = file.getOriginalFilename();
		String pfileName = getRandomIntString(16);
	
		pfileName = pfileName + fileName.substring(fileName.lastIndexOf("."));
		File target = new File(commentRelativeSaveDirectory, pfileName);
		vo.setFile_name(fileName);
		vo.setPfile_name(pfileName);
		vo.setFile_date(vo.getComment_date());
		System.out.println("setFile_date : "+vo.getFile_date());
		
		if(!new File(commentRelativeSaveDirectory).exists()) {
			new File(commentRelativeSaveDirectory).mkdir();
		}
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			commentDao.commentInsert(vo);
			commentDao.commentFileInsert(vo);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return vo;
	}
	@RequestMapping("/ajaxFormCommentFileUpdate.do")
	@ResponseBody
	public CommentVO ajaxFormCommentFileUpdate(CommentVO vo, MultipartFile file) {
		String fileName = file.getOriginalFilename();
		String pfileName = getRandomIntString(16);
	
		pfileName = pfileName + fileName.substring(fileName.lastIndexOf("."));
		File target = new File(commentRelativeSaveDirectory, pfileName);
		vo.setFile_name(fileName);
		vo.setPfile_name(pfileName);
		vo.setFile_date(vo.getComment_date());
		
		if(!new File(commentRelativeSaveDirectory).exists()) {
			new File(commentRelativeSaveDirectory).mkdir();
		}
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			commentDao.commentUpdate(vo);
			commentDao.commentFileUpdate(vo);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return vo;
	}
	
	@RequestMapping("/ajaxReCommentFileInsert.do")
	@ResponseBody
	public CommentVO ajaxReCommentFileInsert(CommentVO vo, MultipartFile file) {
		
		String fileName = file.getOriginalFilename();
		String pfileName = getRandomIntString(16);
	
		pfileName = pfileName + fileName.substring(fileName.lastIndexOf("."));
		File target = new File(commentRelativeSaveDirectory, pfileName);
		vo.setFile_name(fileName);
		vo.setPfile_name(pfileName);
		
		if(!new File(commentRelativeSaveDirectory).exists()) {
			new File(commentRelativeSaveDirectory).mkdir();
		}
		try {
			FileCopyUtils.copy(file.getBytes(), target);
			commentDao.recommentInsert(vo);
			commentDao.commentFileInsert(vo);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return vo;
	}
	

	
	private static String getRandomIntString(int length) {
		StringBuffer sb = new StringBuffer();
		Random random = new Random();

		for (int i = 1; i <= length; i++) {
			
			if(random.nextBoolean()) {
				sb.append((char) ((int) (random.nextInt(26)) + 65));
			
			}else {
				
				sb.append((random.nextInt(10)));
			}
			
			if (i % 4 == 0 && i != length) {
				sb.append("-");
			}
		}
		return sb.toString();
	}
	
	
	@RequestMapping("/ajaxFileSelectList.do")
	@ResponseBody
	public List<CommentVO> ajaxFileChk(CommentVO vo) {
		
		return commentDao.commentFileSelectList();
	}
	
	@RequestMapping("/commentDownload.do")
	public void commentDownload(String pfile_name,String file_name, HttpServletResponse response) throws Exception  {
		System.out.println("pfile_name : "+ pfile_name);
		
		try {
	        	String path = "C:\\Collab\\CollaB_Donggle\\CollaB\\src\\main\\webapp\\resources\\commentFile\\" + pfile_name; //
	        	
	        	File file = new File(path);
	        	response.setHeader("Content-Disposition", "attachment;filename=" + file_name); 
	        	
	        	FileInputStream fileInputStream = new FileInputStream(path);
	        	OutputStream out = response.getOutputStream();
	        	
	        	int read = 0;
	                byte[] buffer = new byte[1024];
	                while ((read = fileInputStream.read(buffer)) != -1) { 
	                    out.write(buffer, 0, read);
	                }
	                
	        } catch (Exception e) {
	            throw new Exception("download error");
	        }
	    }
	@RequestMapping("/ajaxRecommentMaxOrder.do")
	@ResponseBody
	public int ajaxRecommentMaxOrder(CommentVO vo) {
		
		vo = commentDao.recommentMaxOrderSelect(vo);
			
		int n = vo.getComment_order();
		return n;
		
	}
		@RequestMapping("/ajaxGoodBtnChk.do")
		@ResponseBody
		public String ajaxGoodBtnChk(CommentVO vo) {
			vo = commentDao.commentGoodSelect(vo);
			System.out.println("vo : "+vo);
			if(vo== null) {
				return "No";
			}else {
				return "Yes";
			}
			
		}

		@RequestMapping("/ajaxBadBtnChk.do")
		@ResponseBody
		public String ajaxBadBtnChk(CommentVO vo) {
			vo = commentDao.commentBadSelect(vo);
			if(vo == null) {
				return "No";
			}else {
				return "Yes";
			}
		}
		
		@RequestMapping("/ajaxGoodInsert.do")
		@ResponseBody
		public String ajaxGoodInsert(CommentVO vo) {
			
			int chk = commentDao.commentGoodInsert(vo);
			if(chk == 0) {
				return "No";
				
			}else {
				return "Yes";
			}
		}
		@RequestMapping("/ajaxGoodDelete.do")
		@ResponseBody
		public String ajaxGoodDelete(CommentVO vo) {
			int chk = commentDao.commentGoodDelete(vo);
			
			if(chk == 0) {
				return "No";
						
			}else {
				return "Yes";
			}
		}
		@RequestMapping("/ajaxBadInsert.do")
		@ResponseBody
		public String ajaxBadInsert(CommentVO vo) {
			
			int chk = commentDao.commentBadInsert(vo);
			if(chk == 0) {
				return "No";
			}else {
				return "Yes";
			}
		}
		
		@RequestMapping("/ajaxBadDelect.do")
		@ResponseBody
		public String ajaxBadDelect(CommentVO vo) {
			int chk = commentDao.commentBadDelete(vo);
			if(chk == 0) {
				return "No";
			}else {
				
				return "Yes";
			}
		}
		
		@RequestMapping("/ajaxCommentGoodSum.do")
		@ResponseBody
		public int ajaxCommentGoodSum(CommentVO vo) {
			vo = commentDao.commentGoodSelectSum(vo);
			return vo.getSum();
		}
		
		@RequestMapping("/ajaxCommentBadSum.do")
		@ResponseBody
		public int ajaxCommentBadSum(CommentVO vo) {
			vo = commentDao.commentBadSelectSum(vo);
			return vo.getSum();
		}
		
		@RequestMapping("/ajaxRemoveComment.do")
		@ResponseBody
		public String ajaxRemoveComment(CommentVO vo) {
			commentDao.commentDelete(vo);
			commentDao.commentBadDelete(vo);
			commentDao.commentGoodDelete(vo);
			commentDao.commentFileDelete(vo);
			
			return "Yes";
		}
		
		@RequestMapping("/ajaxGroupListSelect.do")
		@ResponseBody
		public List<CommentVO> ajaxGroupListSelect(CommentVO vo){
			return commentDao.commentGroupListSelect(vo);
		}
		
		@RequestMapping("/ajaxFileDelete.do")
		@ResponseBody
		public String ajaxFileDelete(CommentVO vo) {
			int chk = commentDao.commentFileDelete(vo);
			if(chk == 0) {
				return "No";
			}else {
				return "Yes";
			}
			
		}
		
		@RequestMapping("/ajaxCommentModify.do")
		@ResponseBody
		public String ajaxCommentModify(CommentVO vo) {
			int chk = commentDao.commentUpdate(vo);
			if(chk == 0) {
				return "No";
			}else {
				return "Yes";
			}
		}
	
//	@RequestMapping("/commentDownload.do")
//	public void commentDownload(HttpServletRequest req, HttpServletResponse resp,String pfile_name) throws IOException {
//		resp.setContentType("imgage/jpeg");
//		ServletOutputStream out = resp.getOutputStream();
//		
//		String path = "C:\\Collab\\CollaB_Donggle\\CollaB\\src\\main\\webapp\\resources\\commentFile\\" + pfile_name; 
//		FileInputStream fis = new FileInputStream(path);
//		
//		BufferedInputStream bis = new BufferedInputStream(fis);
//		BufferedOutputStream bos = new BufferedOutputStream(out);
//		
//		int readBytes = 0;
//		while ((readBytes = bis.read()) != -1) {
//			bos.write(readBytes);
//		}
//		bis.close();
//		bos.close();
//	}
}
