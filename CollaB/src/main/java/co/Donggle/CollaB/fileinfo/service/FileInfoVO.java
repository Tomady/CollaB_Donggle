package co.Donggle.CollaB.fileinfo.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FileInfoVO {
   private int file_id;
   private String file_name;
   private String pfile_name;
   private int card_id;
   private String id;
   private Date file_upload_date;
   private int file_hits;
   
   //히스토리
   private int history_num;
   private int pre_file_id;
   private Date upload_date;
}
