package co.Donggle.CollaB.fileinfo.service;

import java.util.List;

public interface FileInfoService {
	FileInfoVO cardFileSelect(FileInfoVO vo);
	int cardFileUpload(FileInfoVO vo);
	List<FileInfoVO> cardFileSelectList(int card_id);
	int cardFileDelete(FileInfoVO vo);
}
