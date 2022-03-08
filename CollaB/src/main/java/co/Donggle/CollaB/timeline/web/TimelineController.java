package co.Donggle.CollaB.timeline.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TimelineController {
	
	@RequestMapping("/timeline.do")
	public String timeline() {
		return "timeline/timeline";
	}
}
