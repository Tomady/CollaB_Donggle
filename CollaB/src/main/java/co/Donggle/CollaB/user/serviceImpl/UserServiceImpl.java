package co.Donggle.CollaB.user.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.user.service.UserMapper;
import co.Donggle.CollaB.user.service.UserService;
import co.Donggle.CollaB.user.service.UserVO;

@Repository("userDao")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper map;
	
	@Override
	public List<UserVO> workspaceJoinMembers(BoardVO vo) {
		return map.workspaceJoinMembers(vo);
	}

	@Override
	public List<UserVO> boardJoinMembers(BoardVO vo) {
		return map.boardJoinMembers(vo);
	}

	@Override
	public List<UserVO> outsideBoardMembers(BoardVO vo) {
		return map.outsideBoardMembers(vo);
	}

	@Override
	public String cardManagerSelect(int cardId) {
		return map.cardManagerSelect(cardId);
	}

}
