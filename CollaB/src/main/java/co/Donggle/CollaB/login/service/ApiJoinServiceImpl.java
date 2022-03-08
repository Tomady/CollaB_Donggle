package co.Donggle.CollaB.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.user.service.UserVO;

@Repository("ApiJoinDao")
public class ApiJoinServiceImpl implements ApiJoinService {

	@Autowired
	private ApiJoinMapper map;
	
	@Override
	public int ApiUserJoin(UserVO vo) {
		// TODO Auto-generated method stub
		return map.ApiUserJoin(vo);
	}

}
