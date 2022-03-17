package co.Donggle.CollaB.fileHistory.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VuFileInfo {
	private Date file_upload_date;
	private int file_hits;
	private String card_title;
	private String file_name;
	private int workspace_id;
	private int card_id;
}
