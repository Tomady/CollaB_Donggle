package co.Donggle.CollaB.join.web;



import javax.servlet.http.HttpServletRequest;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.Donggle.CollaB.join.service.JoinMapper;
import co.Donggle.CollaB.user.service.UserVO;

@Controller
public class joinController {
	
	@Autowired
	JoinMapper joinDao;
	
	// 회원가입 페이지로 이동
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "joinForm";
	}
	
	// 회원가입 실행
	@PostMapping("/userInsert.do")
	public String userInsert(HttpServletRequest request){
		
		UserVO vo = new UserVO();
		vo.setId(request.getParameter("id"));
		vo.setPassword(request.getParameter("password"));
		vo.setName(request.getParameter("name"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setCompany(request.getParameter("company"));
		vo.setTel(request.getParameter("tel"));
		vo.setEmail(request.getParameter("email"));

		joinDao.userJoin(vo);
		
		System.out.println("등록 완");
		
		return "workspaceNone";
	}
}
