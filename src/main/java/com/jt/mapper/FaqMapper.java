package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.FaqDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  FaqMapper {

	void insert(FaqDTO faq);
	void update(FaqDTO faq);
	void delete(int seq);
	
	FaqDTO select(int seq);	
	List<FaqDTO> list(SearchDTO search);
	
	void isntChange(ParameterMap param);
	
	int count(SearchDTO search);
	int totalCount();
	int isntYCount();
}
