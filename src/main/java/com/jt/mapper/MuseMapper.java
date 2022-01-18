package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.FrontMuseDTO;
import com.jt.domain.MuseDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  MuseMapper {

	void insertAndUpdate(MuseDTO MuseDTO);
	void delete(int seq);
	
	MuseDTO select(int seq);	
	List<MuseDTO> list(SearchDTO search);
	List<FrontMuseDTO> Frontlist(ParameterMap param);
	List<String> FrontYearlist(String lang); 
	
	int count(SearchDTO search);
	int totalCount();
	int maxSeq();
	int isntYCount();

	void isntChange(ParameterMap param);
	void fileUpdate(ParameterMap param);
}
