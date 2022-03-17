package co.Donggle.CollaB;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.Donggle.CollaB.dy.VO.UserInfo;
import co.Donggle.CollaB.dy.service.DbTestMapper;

@Controller
public class HomeController {
	@Autowired DbTestMapper umap;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(UserInfo uInfo, Model model) {

//		uInfo = umap.UserInfoList();
//		uInfo.getId();
//		model.addAttribute("uInfo", uInfo);
		
		return "home";
	}
	
	@RequestMapping("/doyoung")
	public String doyoung() {
		return "doyoung/doyoung";
	}
	
	@RequestMapping("/aram")
	public String aram() {
		return "aram/aram";
	}
	@RequestMapping("/jaeeui")
	public String jaeeui() {
		return "jaeeui/jaeeui";
	}
	@RequestMapping("/soyeon")
	public String soyeon() {
		return "soyeon/soyeon";
	}
	
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	

	

}
