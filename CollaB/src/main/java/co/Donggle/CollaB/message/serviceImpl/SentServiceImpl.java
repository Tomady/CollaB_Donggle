package co.Donggle.CollaB.message.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.message.service.SentMapper;
import co.Donggle.CollaB.message.service.SentService;
import co.Donggle.CollaB.message.service.SentVO;

@Repository("sentDao")
public class SentServiceImpl implements SentService {
	@Autowired
	private SentMapper map;
	
	@Override
	public int sentMsgInsert(SentVO vo) {
		return map.sentMsgInsert(vo);
	}

	@Override
	public List<SentVO> sentMsgList(SentVO vo) {
		return map.sentMsgList(vo);
	}

	@Override
	public int sentMsgDelete(SentVO vo) {
		return map.sentMsgDelete(vo);
	}

	@Override
	public SentVO sentMsgSelect(SentVO vo) {
		return map.sentMsgSelect(vo);
	}

	@Override
	public int sentMsgStar(SentVO vo) {
		return map.sentMsgStar(vo);
	}

	@Override
	public List<SentVO> sentSearch_to(SentVO vo) {
		return map.sentSearch_to(vo);
	}

	@Override
	public List<SentVO> sentSearch_title(SentVO vo) {
		return map.sentSearch_title(vo);
	}

}
