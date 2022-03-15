package co.Donggle.CollaB.invite.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.invite.service.InviteMapper;
import co.Donggle.CollaB.invite.service.InviteService;
import co.Donggle.CollaB.invite.service.InviteVO;

@Repository("inviteDao")
public class InviteServiceImpl implements InviteService {

	@Autowired
	private InviteMapper map;
	
	@Override
	public int inviteInsert(InviteVO vo) {
		// TODO Auto-generated method stub
		return map.inviteInsert(vo);
	}

	@Override
	public int inviteUpdate(InviteVO vo) {
		// TODO Auto-generated method stub
		return map.inviteUpdate(vo);
	}

	@Override
	public InviteVO inviteEmailConfirmSelect(InviteVO vo) {
		// TODO Auto-generated method stub
		return map.inviteEmailConfirmSelect(vo);
	}

}
