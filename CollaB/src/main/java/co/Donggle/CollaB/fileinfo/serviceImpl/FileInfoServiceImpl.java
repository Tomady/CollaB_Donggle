package co.Donggle.CollaB.fileinfo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.fileinfo.service.FileInfoMapper;
import co.Donggle.CollaB.fileinfo.service.FileInfoService;
import co.Donggle.CollaB.fileinfo.service.FileInfoVO;

@Repository("fileInfoDao")
public class FileInfoServiceImpl implements FileInfoService {
	@Autowired FileInfoMapper map;
	
	@Override
	public FileInfoVO cardFileSelect(FileInfoVO vo) {
		return map.cardFileSelect(vo);
	}

	@Override
	public int cardFileUpload(FileInfoVO vo) {
		return map.cardFileUpload(vo);
	}

	@Override
	public List<FileInfoVO> cardFileSelectList(int card_id) {
		return map.cardFileSelectList(card_id);
	}

	@Override
	public int cardFileDelete(FileInfoVO vo) {
		return map.cardFileDelete(vo);
	}

	@Override
	public List<FileInfoVO> totalFileListInBoard(int board_id) {
		return map.totalFileListInBoard(board_id);
	}

	@Override
	public int cardFileHistoryInsert(FileInfoVO vo) {
		return map.cardFileHistoryInsert(vo);
	}

	@Override
	public int cardFileHistoryInsertExistPrev(FileInfoVO vo) {
		return map.cardFileHistoryInsertExistPrev(vo);
	}

	@Override
	public int cardFileEdit(FileInfoVO vo) {
		return map.cardFileEdit(vo);
	}

	@Override
	public int cardFileCount(FileInfoVO vo) {
		return map.cardFileCount(vo);
	}
}
