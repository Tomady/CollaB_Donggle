package co.Donggle.CollaB.fileHistory.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileInfoVO {
	private int file_id;
	private String file_name;
	private String pfile_name;
	private int card_id;
	private String id;
	private Date file_upload_date;
	private int file_hits;
}
