package co.Donggle.CollaB.login.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.github.scribejava.core.model.OAuth2AccessToken;

import co.Donggle.CollaB.login.service.FacebookLoginBO;
import co.Donggle.CollaB.login.service.GoogleLoginBO;
import co.Donggle.CollaB.login.service.GoogleLoginRequest;
import co.Donggle.CollaB.login.service.GoogleLoginResponse;
import co.Donggle.CollaB.login.service.KakaoLoginBO;
import co.Donggle.CollaB.login.service.LoginUserService;
import co.Donggle.CollaB.login.service.NaverLoginBO;
import co.Donggle.CollaB.login.service.SmsSendBO;
import co.Donggle.CollaB.user.service.UserVO;

@Controller
public class LoginController {
	@Autowired
	private LoginUserService LoginUserDao;
	@Autowired
	private KakaoLoginBO kakao;
	@Autowired
	private NaverLoginBO naverLoginBO;
	@Autowired
	private GoogleLoginBO googleLoginBO;
	@Autowired
	private FacebookLoginBO facebookLoginBO;
	@Autowired
	private JavaMailSender mail;
	@Autowired
	private SmsSendBO sendBO;
	@Autowired 
	BCryptPasswordEncoder pwEncoder;
	
	// 로그인 페이지 이동
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}

	//index
	@ResponseBody
	@RequestMapping(value = "/ajaxLoginChk.do", produces = "application/text; charset=utf8")
	public String ajaxLoginChk(UserVO vo, HttpSession session) {
		UserVO compareVo = new UserVO();
		compareVo = LoginUserDao.userLogin(vo);
		
		if(compareVo != null && pwEncoder.matches(vo.getPassword(), compareVo.getPassword())) {
			session.setAttribute("id", compareVo.getId());
			session.setAttribute("name", compareVo.getName());
			session.setAttribute("email", compareVo.getEmail());
			session.setAttribute("nickname", compareVo.getNickname());
			session.setAttribute("prof_pic", compareVo.getProf_pic());
			String nickname = compareVo.getNickname();
			return nickname;
			
		}else {
			return "No";
		}
	}
	
	//index
	@RequestMapping("/logout.do")
	public String logout(UserVO vo, HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	
	@RequestMapping("/kakaologinUrl.do")
	@ResponseBody
	public String kakaologinUrl() {
		String authorUrl = kakao.getAuthorizationUrl();
		return authorUrl;

	}
	//login
	@RequestMapping("/kakaologin.do")
	public String kakaologin(@RequestParam String code, HttpSession session, UserVO vo, Model model) {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);

		String email = (String) userInfo.get("email");
		String name = (String) userInfo.get("nickname");
		String profile_image = (String) userInfo.get("profile_image");

		vo.setName(name);
		vo.setEmail(email);
		vo = LoginUserDao.idFindNameEmailChk(vo);

		if (vo != null) {
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("id", vo.getId());
			session.setAttribute("nickname", vo.getNickname());
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", vo.getEmail());
			return "redirect:index.do";
		} else {
			model.addAttribute("email", email);
			model.addAttribute("name", name);
			model.addAttribute("profile_image", profile_image);
			model.addAttribute("token", "카카오");
			return "apiJoinForm";
		}
	}

	@RequestMapping("/kakaoLogoutUrl.do")
	@ResponseBody
	public String kakaoLogoutUrl() {
		String kakaoLogoutUrl = kakao.kakaoLogout();
		return kakaoLogoutUrl;
	}
	
	@RequestMapping("/kakaoLogout.do")
	public String kakaologout(HttpSession session) {
		
		session.invalidate();

		return "redirect:login.do";
	}
	
	

	//login
	@RequestMapping("/apiJoinForm.do")
	public String apiLogin() {
		return "apiJoinForm";
	}

	//login
	@ResponseBody
	@RequestMapping("/naverlogin.do")
	public String naverlogin(HttpSession session) {
		String reqUrl = naverLoginBO.getAuthorizationUrl(session);
		return reqUrl;
	}

	//login
	@RequestMapping("/naverlogininfo.do")
	public String callback(Model model, UserVO vo, @RequestParam String code, @RequestParam String state,
			HttpSession session) throws IOException, ParseException {

		OAuth2AccessToken oauthToken;

		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		String apiResult = naverLoginBO.getUserProfile(oauthToken);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);

		JSONObject jsonObj = (JSONObject) obj;

		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		String access_token = oauthToken.getAccessToken();

		String email = (String) response_obj.get("email");
		String nickname = (String) response_obj.get("nickname");
		String name = (String) response_obj.get("name");
		String profile_image = (String) response_obj.get("profile_image");
		String tel = (String) response_obj.get("mobile");
	
		vo.setEmail(email);
		vo.setName(name);
		vo = LoginUserDao.idFindNameEmailChk(vo);

		if (vo != null) {
			session.setAttribute("access_Token", access_token);
			session.setAttribute("id", vo.getId());
			session.setAttribute("nickname", vo.getNickname());
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", vo.getEmail());
			return "redirect:index.do";
		} else {
			model.addAttribute("email", email);
			model.addAttribute("nickname", nickname);
			model.addAttribute("name", name);
			model.addAttribute("profile_image", profile_image);
			model.addAttribute("tel", tel);
			model.addAttribute("token", "네이버");
			return "apiJoinForm";
		}
	}

	//login
	@RequestMapping("/naverLogout.do")
	@ResponseBody
	public String remove(HttpSession session, HttpServletRequest request, Model model) {
//		String apiUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=" + NaverLoginBO.CLIENT_ID
//				+ "&client_secret=" + NaverLoginBO.CLIENT_SECRET + "&access_token=" + token.replaceAll("'", "")
//				+ "&service_provider=NAVER";
		String apiUrl = "https://nid.naver.com/nidlogin.logout";

		session.invalidate();

		return apiUrl;
	}

	//login
	private String requestToServer(String apiURL) throws IOException {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");

		int responseCode = con.getResponseCode();
		BufferedReader br;

		if (responseCode == 200) {
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else {
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			res.append(inputLine);
		}
		br.close();
	
		if (responseCode == 200) {
			String new_res = res.toString().replaceAll("&#39;", "");
			return new_res;
		} else {
			return null;
		}
	}

	//login
	@RequestMapping("/googleLoginUrl.do")
	@ResponseBody
	public String googleLogin() {

		String googleLoginUrl = googleLoginBO.googleInitUrl();

		return googleLoginUrl;
	}

	//login
	@RequestMapping("/googlelogin.do")
	public String googleAuth(Model model, UserVO vo, HttpSession session, @RequestParam(value = "code") String authCode)
			throws JsonProcessingException {
		String GOOGLE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/token";
		RestTemplate restTemplate = new RestTemplate();

		GoogleLoginRequest googleOAuthRequestParam = GoogleLoginRequest.builder()
				.clientId(googleLoginBO.getGoogleClientId()).clientSecret(googleLoginBO.getGoogleSecret())
				.code(authCode).redirectUri(googleLoginBO.getGoogleRedirectUrl()).grantType("authorization_code")
				.build();

		ObjectMapper mapper = new ObjectMapper();
		mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
		mapper.setSerializationInclusion(Include.NON_NULL);

		ResponseEntity<String> resultEntity = restTemplate.postForEntity(GOOGLE_TOKEN_BASE_URL, googleOAuthRequestParam,
				String.class);

		GoogleLoginResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleLoginResponse>() {
		});

		String jwtToken = result.getIdToken();

		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
				.queryParam("id_token", jwtToken).toUriString();

		String resultJson = restTemplate.getForObject(requestUrl, String.class);

		Map<String, String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>() {
		});

		String email = (String) userInfo.get("email");
		String name = (String) userInfo.get("name");
		String picture = (String) userInfo.get("picture");

		vo.setEmail(email);
		vo.setName(name);
		vo = LoginUserDao.idFindNameEmailChk(vo);
		vo = LoginUserDao.idFindNameEmailChk(vo);

		if (vo != null) {
			session.setAttribute("id", vo.getId());
			session.setAttribute("nickname", vo.getNickname());
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", vo.getEmail());
			return "redirect:index.do";
		} else {
			model.addAttribute("email", email);
			model.addAttribute("name", name);
			model.addAttribute("profile_image", picture);
			model.addAttribute("token", "구글");
			return "apiJoinForm";
		}

	}
	//login
	@RequestMapping("/googleLogout.do")
	@ResponseBody
	public String googleLogout(HttpSession session) {
		String logoutUrl = "https://accounts.google.com/logout";
		session.invalidate();
		
		return logoutUrl;
	}

	//login
	@RequestMapping("/facebookLoginUrl.do")
	@ResponseBody
	public String facebookLoginUrl() {
		String facebookUrl = facebookLoginBO.getAuthorizationUrl();
	
		return facebookUrl;
	}

	//login
	@RequestMapping("/https://localhost/CollaB/facebookLogin.do")
	public String facebookLogin(String code, HttpSession session, String state) throws Exception {
		String accessToken = facebookLoginBO.requestFaceBooktAccesToken(session, code);
		String facebookResult = facebookLoginBO.facebookUserDataLoadAndSave(accessToken, session);

		return "ok";
	}

	//login
	@RequestMapping("/facebookLogout.do")
	public String facebookLogout() {
		return "";
	}

	//login
	@ResponseBody
	@RequestMapping(value = "/ajaxTokenChk.do", produces = "application/text; charset=utf8")
	public String ajaxTokenChk(HttpSession session, UserVO vo) {
		vo.setId((String) session.getAttribute("id"));
		vo = LoginUserDao.passwordFindIdChk(vo);


		if (vo.getToken() == null) {
			return "No";
		} else {
			return vo.getToken();
		}
	}

	@RequestMapping("/idFindMenu.do")
	public String idFindForm() {
		return "idFindMenu";
	}

	@RequestMapping("/idFindEmail.do")
	public String idFindEmail() {
		return "idFindEmail";
	}

	@RequestMapping("/idFindTel.do")
	public String idFindTel() {
		return "idFindTel";
	}

	@RequestMapping("/ajaxNameEmailChk.do")
	@ResponseBody
	public String ajaxNameEmailChk(UserVO vo) {

		vo = LoginUserDao.idFindNameEmailChk(vo);
		if (vo == null) {
			return "No";
		} else {
			return "Yes";
		}
	}

	@RequestMapping("/ajaxEmailConfirm.do")
	@ResponseBody
	public String ajaxEmailConfirm(int randomnum, UserVO vo) throws MessagingException {

		MimeMessage message = mail.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		messageHelper.setFrom(new InternetAddress("hajay0133@gmail.com"));
		messageHelper.setTo(vo.getEmail());
		messageHelper.setSubject("CollaB 인증번호 입니다.");
		String str = "<html><head> <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n"
				+ "    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n"
				+ "    <link href=\"https://fonts.googleapis.com/css2?family=Jua&display=swap\" rel=\"stylesheet\">"
				+ "<body>    <div style=\"width: 400px; height: 280px; background-color: mediumaquamarine; font-family: 'Jua', sans-serif; text-align: center; display: inline-block;\">\r\n"
				+ "        <br><br>\r\n"
				+ "        <div><span style=\"font-size: 20px; font-weight: bold; color: #fff;\">안녕하세요 </span>\r\n"
				+ "             <span style=\"font-size: 24px; font-weight: bold; color: orangered;\">CollaB</span>\r\n"
				+ "            <span style=\"font-size: 20px; font-weight: bold; color: #fff;\"> 입니다.</span>\r\n"
				+ "        </div>\r\n" + "        <br>\r\n"
				+ "        <div style=\"width: 300px; height: 110px; background-color: #fff; display: inline-block; border-radius: 10px;\">\r\n"
				+ "            <br><br>\r\n"
				+ "            <span style=\"font-size: 18px; font-weight: bold; color: black;\">인증번호 : </span>\r\n"
				+ "            <span style=\"font-size: 22px; font-weight: bold; color: orangered;\">" + randomnum
				+ "</span>\r\n" + "        </div>\r\n" + "        <br><br>\r\n"
				+ "        <div style=\"display: inline-block;\">\r\n"
				+ "            <span style=\"font-size: 16px; font-weight: bold; color: black;\">3분 이내로 인증번호(6자리)를 입력해 주세요.</span>\r\n"
				+ "        </div>\r\n" + "    </div>\r\n" + "</body>\r\n" + "\r\n" + "</html>";
		messageHelper.setText(str, true);
		mail.send(message);

		return "Yes";
	}

	@RequestMapping(value = "/ajaxIdFind.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxIdFind(UserVO vo) {
		vo = LoginUserDao.idFindNameEmailChk(vo);
	
		return vo.getId();
	}

	@RequestMapping("/passwordFindMenu.do")
	public String passwordFindMenu() {
		return "passwordFindMenu";
	}

	@RequestMapping("/ajaxNameTelChk.do")
	@ResponseBody
	public String ajaxNameTelChk(UserVO vo) {
		vo = LoginUserDao.idFindNameTelChk(vo);
		if (vo == null) {
			return "No";
		} else {
			return "Yes";
		}
	}

	@RequestMapping("/ajaxTelConfirm.do")
	@ResponseBody
	public String ajaxTelConfirm(int randomnum, UserVO vo) {
		String result = sendBO.smsSend(vo.getTel(), randomnum);
	
		if (result.equals("Yes")) {
			return "Yes";
		} else {
			return "No";
		}

	}

	@RequestMapping(value = "/ajaxIdTelFind.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxIdTelFind(UserVO vo) {
		vo = LoginUserDao.idFindNameTelChk(vo);
		if (vo == null) {
			return "No";
		} else {
			return vo.getId();
		}
	}

	@RequestMapping(value = "/ajaxPasswordFindIdChk.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxPasswordFindIdChk(UserVO vo) {
		vo = LoginUserDao.passwordFindIdChk(vo);

		if (vo == null) {
			return "No";
		} else {
			return vo.getId();
		}
	}

	@RequestMapping(value = "/ajaxPasswordTelFind.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxPasswordTelFind(UserVO vo) {

		vo = LoginUserDao.idFindNameTelChk(vo);
		if (vo == null) {
			return "No";
		} else {

			return vo.getId();
		}
	}

	@RequestMapping(value = "/ajaxPasswordEmailFind.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String ajaxPasswordEmailFind(UserVO vo) {

		vo = LoginUserDao.idFindNameEmailChk(vo);
		if (vo == null) {
			return "No";

		} else {
			return vo.getId();
		}
	}

	@RequestMapping("/passwordFindMenuNext.do")
	public String passwordFindMenuNext(UserVO vo, Model model) {
		vo = LoginUserDao.passwordFindIdChk(vo);

		String tel = vo.getTel();
		String email = vo.getEmail();
		String telResult = "( +82 10 - " + tel.substring(4, 6) + "** - " + tel.substring(9, 11) + "** )";

		String arrEmail[] = email.split("@");
		String str = arrEmail[0];
		String arr = "";
		for (int i = 0; i < str.length() - 2; i++) {
			arr += "*";
		}

		String emailResult = "( " + arrEmail[0].substring(0, 2) + arr + "@" + arrEmail[1] + " )";


		model.addAttribute("name", vo.getName());
		model.addAttribute("tel", telResult);
		model.addAttribute("email", emailResult);
		return "passwordFindMenuNext";
	}

	@RequestMapping("/passwordFindTel.do")
	public String passwordFindTel() {
		return "passwordFindTel";
	}

	@RequestMapping("/passwordFindEmail.do")
	public String passwordFindEmail() {
		return "passwordFindEmail";
	}

	@RequestMapping("/ajaxPasswordChange.do")
	@ResponseBody
	public String ajaxPasswordChange(UserVO vo) {
		vo.setPassword(pwEncoder.encode(vo.getPassword()));
		int updateResult = LoginUserDao.passwordFindPasswordChange(vo);
		if (updateResult == 0) {
			return "No";
		} else {
			return "Yes";
		}
	}
}