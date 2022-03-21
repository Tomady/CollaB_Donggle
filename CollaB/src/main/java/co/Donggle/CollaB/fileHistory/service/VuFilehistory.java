package co.Donggle.CollaB.fileHistory.service;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VuFilehistory {
	private String pre_file;
	private int card_id;
	private String file_name;
	private String card_title;
	private Date file_upload_date;
	private int file_hits;
	private String pfile_name;
	private Date upload_date;
	private int workspace_id;
}
