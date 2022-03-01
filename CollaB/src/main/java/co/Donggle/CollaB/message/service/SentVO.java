package co.Donggle.CollaB.message.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//보낸메시지함
public class SentVO {
	private int sent_id;
	private String id; //보낸사람
	private Date sent_date;
	private String sent_title;
	private String sent_contents;
	private String sent_to; //받는사람
	private String sent_star;
}
