package co.Donggle.CollaB.join.web;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public String userInsert(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
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
		
		response.setContentType("text/html; utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원가입 완료! 바로 로그인해보세요.');</script>");
		out.flush();
		
		return "login";
	}
}
