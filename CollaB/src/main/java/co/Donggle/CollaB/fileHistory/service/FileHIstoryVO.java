package co.Donggle.CollaB.fileHistory.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileHIstoryVO {
	private int history_num;
	private int file_id;
	private int pre_file_id;
	private String pfile_name;
}
