package co.Donggle.CollaB.memberPage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.user.service.UserVO;
@Repository("memberPageUserDao")
public class MemberPageUserServiceImpl implements MemberPageUserService {

	@Autowired
	private MemberPageUserMapper map;
	
	@Override
	public List<UserVO> memberPageUserSearch(UserVO vo) {
		// TODO Auto-generated method stub
		return map.memberPageUserSearch(vo);
	}

}
