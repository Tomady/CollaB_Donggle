package co.Donggle.CollaB.join.web;



import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.join.service.JoinMapper;
import co.Donggle.CollaB.join.service.JoinVO;


@Controller
public class joinController {
	
	@Autowired JoinMapper joinDao;
	@Autowired BCryptPasswordEncoder pwEncoder;
	
	// 회원가입 페이지로 이동
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "joinForm";
	}
	
	// 회원가입 실행
	@PostMapping("/userInsert.do")
	public void userInsert(JoinVO vo, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; utf-8");
		PrintWriter out = response.getWriter();
		vo.setPassword(pwEncoder.encode(vo.getPassword()));
		int n = joinDao.userJoin(vo);
		if(n == 1) {		
			System.out.println("등록 완");			
			out.println("<script>alert('회원가입 완료! 바로 로그인해보세요.'); location.href='login.do';</script>");
			out.flush();
			
			
		}else {
			out.println("<script>alert('회원가입 실패!'); history.back();</script>");
			out.flush();
		}
	
	}
	
	// 아이디 중복 확인
	@ResponseBody
	@RequestMapping("/idChk.do")
	public int idChk(JoinVO vo) throws Exception{
		int result = joinDao.idChk(vo);
		return result;
	}
}
