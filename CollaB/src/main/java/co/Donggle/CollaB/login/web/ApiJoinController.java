package co.Donggle.CollaB.login.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import co.Donggle.CollaB.login.service.ApiJoinService;
import co.Donggle.CollaB.user.service.UserVO;

@Controller
public class ApiJoinController {

	@Autowired
	private ApiJoinService ApiJoinDao;

	@RequestMapping("/apiUserInsert.do")
	public void apiUserInsert(UserVO vo, HttpServletResponse response) throws IOException {
		
		ApiJoinDao.ApiUserJoin(vo);
		response.setContentType("text/html; utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원가입 완료! 바로 로그인해보세요.');</script>");
		out.println("<script>location.href='login.do'</script>");
		out.flush();

	}

}
