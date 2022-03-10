package co.Donggle.CollaB.timeline.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TimelineCardVO {
	private int card_id;
	private String card_title;
	private Date card_start_date;
	private Date card_end_date;
	private String card_contents;
	private int list_id;
	
	private String card_label;
	private String manager;
	
	
}
