package co.Donggle.CollaB.jay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.user.service.UserVO;

@Repository("userDao")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper map;
	
	@Override
	public UserVO userLogin(UserVO vo) {
		// TODO Auto-generated method stub
		return map.userLogin(vo);
	}

}
