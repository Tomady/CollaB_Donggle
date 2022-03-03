package co.Donggle.CollaB.message.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.message.service.InboxMapper;
import co.Donggle.CollaB.message.service.InboxService;
import co.Donggle.CollaB.message.service.InboxVO;

@Repository("inboxDao")
public class InboxServiceImpl implements InboxService {
	@Autowired
	private InboxMapper map;

	@Override
	public List<InboxVO> inboxList(InboxVO vo) {
		return map.inboxList(vo);
	}

	@Override
	public int inboxMsgDelete(InboxVO vo) {
		return map.inboxMsgDelete(vo);
	}

	@Override
	public List<InboxVO> unreadList(InboxVO vo) {
		return map.unreadList(vo);
	}

	@Override
	public InboxVO inboxSelectMsg(InboxVO vo) {
		return map.inboxSelectMsg(vo);
	}

	@Override
	public int starMsg(InboxVO vo) {
		return map.starMsg(vo);
	}

	@Override
	public int inboxMsgConfirm(InboxVO vo) {
		return map.inboxMsgConfirm(vo);
	}

	@Override
	public int inboxMsgInsert(InboxVO vo) {
		return map.inboxMsgInsert(vo);
	}

	@Override
	public int inboxUnreadMsg(InboxVO vo) {
		return map.inboxUnreadMsg(vo);
	}

	@Override
	public List<InboxVO> inboxStarList(InboxVO vo) {
		return map.inboxStarList(vo);
	}

	@Override
	public List<InboxVO> inboxSearch_writer(InboxVO vo) {
		return map.inboxSearch_writer(vo);
	}

	@Override
	public List<InboxVO> inboxSearch_title(InboxVO vo) {
		return map.inboxSearch_title(vo);
	}

	@Override
	public List<InboxVO> inboxStarSearch_writer(InboxVO vo) {
		return map.inboxStarSearch_writer(vo);
	}

	@Override
	public List<InboxVO> inboxStarSearch_title(InboxVO vo) {
		return map.inboxStarSearch_title(vo);
	}



}
