package co.Donggle.CollaB.user.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.user.service.UserMapper;
import co.Donggle.CollaB.user.service.UserService;
import co.Donggle.CollaB.user.service.UserVO;

@Repository("userDao")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper map;
	
	@Override
	public int userJoin(UserVO vo) {
		return map.userJoin(vo);
	}

}
