package co.Donggle.CollaB.login.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.Donggle.CollaB.join.service.JoinMapper;
import co.Donggle.CollaB.join.service.JoinVO;
import co.Donggle.CollaB.login.service.ApiJoinService;
import co.Donggle.CollaB.user.service.UserVO;

@Controller
public class ApiJoinController {

	@Autowired
	private ApiJoinService ApiJoinDao;
	
	@Autowired 
	BCryptPasswordEncoder pwEncoder;

	@Autowired 
	JoinMapper joinDao;
	

	
	
	// 회원가입 실행
	@PostMapping("/apiUserInsert.do")
	public void userInsert(UserVO vo, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; utf-8");
		PrintWriter out = response.getWriter();
		vo.setPassword(pwEncoder.encode(vo.getPassword()));
		int n = ApiJoinDao.ApiUserJoin(vo);
		if(n == 1) {		
			System.out.println("등록 완");			
			out.println("<script>alert('회원가입 완료! CollaB를 시작해 보세요.'); location.href='index.do';</script>");
			out.flush();
			
			
		}else {
			out.println("<script>alert('회원가입 실패!'); history.back();</script>");
			out.flush();
		}
	
	}

}
