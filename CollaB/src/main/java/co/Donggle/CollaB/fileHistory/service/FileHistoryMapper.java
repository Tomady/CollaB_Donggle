package co.Donggle.CollaB.fileHistory.service;

import java.util.List;

public interface FileHistoryMapper {
	List<VuFileInfo> fileInfoList(int workspaceid);
	List<VuFilehistory> fileCardList(int workspaceid);
}
