package co.Donggle.CollaB.login.service;

import co.Donggle.CollaB.user.service.UserVO;

public interface LoginUserService {
	UserVO userLogin(UserVO vo);
	UserVO idFindNameEmailChk(UserVO vo);
}
