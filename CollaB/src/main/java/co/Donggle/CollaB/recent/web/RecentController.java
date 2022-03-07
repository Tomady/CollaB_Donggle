package co.Donggle.CollaB.recent.web;

import java.util.List;

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
	
	// recent 목록 불러오기
	@RequestMapping("/recentList")
	@ResponseBody
	public List<RecentVO> recentList(RecentVO vo){
		return RecentDao.recentBoard();
	}
	
	// recent에 추가하기
	@RequestMapping("/recentAdd")
	@ResponseBody
	public void recentAdd(RecentVO vo) {
		RecentDao.insertRecent(vo);
	}

}
