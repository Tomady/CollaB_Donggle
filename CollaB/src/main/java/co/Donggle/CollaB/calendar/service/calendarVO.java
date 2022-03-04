package co.Donggle.CollaB.calendar.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class calendarVO {
	
	private int card_id;
	private String card_title;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date card_start_date;
	private int list_id;
	private String card_contents;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date card_end_date;
	private String card_label;
	private String manager;
	private int board_id;

}
