package co.Donggle.CollaB.memberPage.service;

import java.util.List;

import co.Donggle.CollaB.user.service.UserVO;

public interface MemberPageUserService {
	List<UserVO> memberPageUserSearch(UserVO vo);
	UserVO memberPageUserSelect(UserVO vo);
	UserVO memberPageUserEmailSelect(UserVO vo);
	
}
