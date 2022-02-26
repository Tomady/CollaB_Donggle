package co.Donggle.CollaB.user.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVO {
	private String id;
	private String name;
	private String nickname;
	private String password;
	private String email;
	private String prof_pic;
	private String tel;
	private String company;
	private String token;
}
