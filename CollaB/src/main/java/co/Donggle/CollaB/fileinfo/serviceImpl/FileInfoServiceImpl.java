package co.Donggle.CollaB.fileinfo.serviceImpl;

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
}
