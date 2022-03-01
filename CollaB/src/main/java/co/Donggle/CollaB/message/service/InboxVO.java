package co.Donggle.CollaB.message.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
//받은메시지함
public class InboxVO {
	private int inbox_id; //일련번호
	private String id; //받는사람
	private Date receive_date;
	private String receive_title;
	private String receive_contents;
	private String receive_from; //보내는사람
	private String receive_star;
	private String receive_confirm;
}
