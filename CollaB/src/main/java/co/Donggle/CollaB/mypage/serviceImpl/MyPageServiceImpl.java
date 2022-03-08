package co.Donggle.CollaB.mypage.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.mypage.service.MyPageMapper;
import co.Donggle.CollaB.mypage.service.MyPageService;
import co.Donggle.CollaB.mypage.service.MyPageVO;

@Repository("MyPageDao")
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	MyPageMapper MyPageMapper;

	@Override
	public MyPageVO userSelect(MyPageVO vo) {
		return MyPageMapper.userSelect(vo);
	}

	@Override
	public int updateProfile(MyPageVO vo) {
		return MyPageMapper.updateProfile(vo);
	}

	@Override
	public int updateInfo(MyPageVO vo) {
		return MyPageMapper.updateInfo(vo);
	}

	@Override
	public int updatePw(MyPageVO vo) {
		return MyPageMapper.updatePw(vo);
	}

	@Override
	public int deleteUser(MyPageVO vo) {
		return MyPageMapper.deleteUser(vo);
	}

}
