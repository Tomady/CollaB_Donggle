package co.Donggle.CollaB.card.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CardVO {
	//card
	private int card_id;
	private String card_title;
	private Date card_start_date;
	private int list_id;
	private String card_contents;
	private Date card_end_date;
	private String card_label;
	private String manager;
	
	// 카드삭제
	// : 카드,카드댓글,댓글파일,댓글좋아요,첨부파일,첨부파일내역,체크리스트,체크리스트item 전부삭제
	// => 카드댓글아이디, 파일아이디, 체크리스트 아이디 필요
	private int comment_id;
	private int file_id;
	private int checklist_id;
}
