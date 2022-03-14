package co.Donggle.CollaB.invite.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class InviteVO {
	
	
	private int invite_num;
	private String invite_code;
	private String invite_confirm;
	private int workspace_id;
	private String user_email;
	private String user_emailconfirm;
	
}
