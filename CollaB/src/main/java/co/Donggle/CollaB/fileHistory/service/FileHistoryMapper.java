package co.Donggle.CollaB.fileHistory.service;

import java.util.List;

public interface FileHistoryMapper {
	List<FileHIstoryVO> fileHistoryList();
	List<VuFilehistory> fileCardList(int workspaceid);
}