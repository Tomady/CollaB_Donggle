package co.Donggle.CollaB.fileinfo.service;

import java.util.List;

public interface FileInfoMapper {
	FileInfoVO cardFileSelect(FileInfoVO vo);
	int cardFileUpload(FileInfoVO vo);
	List<FileInfoVO> cardFileSelectList(int card_id);
	int cardFileDelete(FileInfoVO vo);
	
	List<FileInfoVO> totalFileListInBoard(int board_id);
	
	//파일히스토리-첫번째파일
	int cardFileHistoryInsert(FileInfoVO vo);
	//파일히스토리-두번째이후파일insert
	int cardFileHistoryInsertExistPrev(FileInfoVO vo);
	//파일-파일수정
	int cardFileEdit(FileInfoVO vo);
	//파일-해당카드에 파일 1개인지 0개인지 판단
	int cardFileCount(FileInfoVO vo);
	
}
