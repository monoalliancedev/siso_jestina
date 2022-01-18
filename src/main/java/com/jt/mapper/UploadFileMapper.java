package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.UploadFileDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  UploadFileMapper {

	void insert(UploadFileDTO file);
	void delete(int seq);
	void update_pseq(ParameterMap param);
	void update_file_size(ParameterMap param);
	void update_save_filename(ParameterMap param);
	UploadFileDTO select(int seq);	
	UploadFileDTO one(int seq);
	List<UploadFileDTO> list(ParameterMap param);
	List<UploadFileDTO> all_list(ParameterMap param);
	int count(ParameterMap param);
	int lastSeq();
	
	

}
