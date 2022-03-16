package co.Donggle.CollaB.fileHistory.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileCardVO {
	private int card_id;
	private String card_title;
	private Date start_date;
	private int list_id;
	private String card_contents;
	private Date card_end_date;
	private String card_label;
	private String manager;
	private String card_thema;
}
