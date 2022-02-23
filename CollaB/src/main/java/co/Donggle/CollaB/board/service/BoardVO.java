package co.Donggle.CollaB.board.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int board_id;
	private String board_Title;
	private int workspace_id;
	private String board_thema;
	
	private String workspace_title;
	private String id;
	private Date workspace_create_date;
}
