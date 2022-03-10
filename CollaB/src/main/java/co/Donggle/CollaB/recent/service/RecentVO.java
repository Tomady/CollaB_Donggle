package co.Donggle.CollaB.recent.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecentVO {
	
	private Date invite;
	private int board_id;
	private String id;
	private String board_title;

}
