package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.BoardJtDTO;
import com.jt.domain.FrontBoardJtDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  BoardJtMapper {

	void insert(BoardJtDTO boardJtDTO);
	void update(BoardJtDTO boardJtDTO);
	void delete(int seq);
	
	BoardJtDTO select(int seq);	
	List<BoardJtDTO> list(SearchDTO search);
	
	int max_seq(ParameterMap param);
	void isntChange(ParameterMap param);
	void fileUpdate(ParameterMap param);
	
	int count(SearchDTO search);
	int totalCount(String gubun);
	int isntYCount(String gubun);
	
	FrontBoardJtDTO MainNews(String lang);
	FrontBoardJtDTO FrontSelect(ParameterMap param);	
	List<FrontBoardJtDTO> FrontList(SearchDTO search); 
	FrontBoardJtDTO FrontPreSelect(SearchDTO search);	
	FrontBoardJtDTO FrontNextSelect(SearchDTO search);	
	
	
	
}
