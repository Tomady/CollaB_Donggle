package co.Donggle.CollaB.list.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ListVO {
	private int list_id;
	private String list_title;
	private int board_id;
	private String id;
	
	//card
	private int card_id;
	private String card_title;
	private Date card_start_date;
	private String card_contents;
	private Date card_end_date;
	private String card_label;
	private String manager;
}
