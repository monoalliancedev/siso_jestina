package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.RomasonDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  RomasonMapper {

	void insertAndUpdate(RomasonDTO romason);
	void delete(int seq);
	
	RomasonDTO select(int seq);	
	List<RomasonDTO> list(SearchDTO search);
	
	int count(SearchDTO search);
	int totalCount();
	int isntYCount();
	
	void isntChange(ParameterMap param);
	void fileUpdate(ParameterMap param);
	
	List<RomasonDTO> FrontNewList();
	List<RomasonDTO> FrontList(int category);
	RomasonDTO FrontSelect(ParameterMap param);	
}
