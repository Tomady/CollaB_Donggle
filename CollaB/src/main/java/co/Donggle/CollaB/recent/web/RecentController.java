package co.Donggle.CollaB.recent.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.recent.service.RecentService;
import co.Donggle.CollaB.recent.service.RecentVO;

@Controller
public class RecentController {
	
	@Autowired
	RecentService RecentDao;
	
	// recent리스트
	@RequestMapping("/recentList")
	public List<RecentVO> recentList(RecentVO vo, HttpSession session) {
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		return RecentDao.recentBoard(vo);
	}
	
	// recent에 추가하기
	@RequestMapping("/recentAdd")
	@ResponseBody
	public void recentAdd(RecentVO vo) {
		RecentDao.insertRecent(vo);
	}

}
