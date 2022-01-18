package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.SearchDTO;
import com.jt.domain.StoreDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  StoreMapper {

	void insertAndUpdate(StoreDTO store);
	void delete(int seq);
	
	StoreDTO select(int seq);	
	List<StoreDTO> list(SearchDTO search);
	
	int count(SearchDTO search);
	int totalCount(String gubun);
	
	void sortChange(ParameterMap param);
	
	StoreDTO UpSelect(ParameterMap param);
	StoreDTO DownSelect(ParameterMap param);
}
