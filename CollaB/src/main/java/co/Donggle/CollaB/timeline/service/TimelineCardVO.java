package co.Donggle.CollaB.timeline.service;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TimelineCardVO {
	private int card_id;
	private String card_title;
	private String card_start_date;
	private String card_end_date;
	private String card_contents;
	private int list_id;
	
	private String card_label;
	private String manager;
}
