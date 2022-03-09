package co.Donggle.CollaB.memberPage.service;

import java.util.List;

import co.Donggle.CollaB.user.service.UserVO;

public interface MemberPageUserMapper {
	List<UserVO> memberPageUserSearch(UserVO vo);
}
