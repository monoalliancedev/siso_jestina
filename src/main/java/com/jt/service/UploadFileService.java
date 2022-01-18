package com.jt.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.jt.domain.UploadFileDTO;
import com.jt.util.ParameterMap;


public interface UploadFileService {

	public void delete(int seq);
	public void update_file_size(ParameterMap param);
	public void update_save_filename(ParameterMap param);
	public UploadFileDTO select(int seq);	
	public UploadFileDTO one(int seq);
	public List<UploadFileDTO> all_list(ParameterMap param);
	public int count(ParameterMap param);
	
	
	public void insert(UploadFileDTO file);
	public int insertAndSeq(UploadFileDTO file);
	public void update_pseq(ParameterMap param);
	
	
	public List<UploadFileDTO> list(ParameterMap param);
	
	
	public void selectAndDelete(int seq);
	public int JtFileUpload(String UploadFolder, MultipartFile aFile, String id, Integer key);
	public int[] fileUploadMultiInsert(String UploadFolder, List<MultipartFile> fileList, String id);
	public int[] fileUploadMultiUpdate(String UploadFolder, List<MultipartFile> fileList, Integer[] fileViewSeq, String id); 
			
}
