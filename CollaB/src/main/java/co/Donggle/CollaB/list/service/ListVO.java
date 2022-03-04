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
	
	
	// 리스트삭제
	// : 리스트,카드,카드댓글,댓글파일,댓글좋아요,첨부파일,첨부파일내역,체크리스트,체크리스트item 전부삭제
	// => 카드아이디, 카드댓글아이디, 파일아이디, 체크리스트 아이디 필요
	//card
	private int card_id;
	private String card_title;
	private Date card_start_date;
	private String card_contents;
	private Date card_end_date;
	private String card_label;
	private String manager;
}
