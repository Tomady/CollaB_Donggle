package co.Donggle.CollaB.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.user.service.UserVO;

@Repository("LoginUserDao")
public class LoginUserServiceImpl implements LoginUserService {

	@Autowired
	private LoginUserMapper map;
	
	@Override
	public UserVO userLogin(UserVO vo) {
		// TODO Auto-generated method stub
		return map.userLogin(vo);
	}

	@Override
	public UserVO idFindNameEmailChk(UserVO vo) {
		// TODO Auto-generated method stub
		return map.idFindNameEmailChk(vo);
	}

	@Override
	public UserVO idFindNameTelChk(UserVO vo) {
		// TODO Auto-generated method stub
		return map.idFindNameTelChk(vo);
	}

	@Override
	public UserVO passwordFindIdChk(UserVO vo) {
		// TODO Auto-generated method stub
		return map.passwordFindIdChk(vo);
	}

}
