package com.jt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jt.domain.BoardJtDTO;
import com.jt.domain.FrontBoardJtDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;


public interface BoardJtService {

	public void insert(BoardJtDTO BoardJt, HttpServletRequest request);
	public void update(BoardJtDTO BoardJt, HttpServletRequest request);
	public void delete(int seq);
	
	public BoardJtDTO select(int seq);	
	public List<BoardJtDTO> list(SearchDTO search);
	
	public int max_seq(ParameterMap param);
	public void isntChange(ParameterMap param);
	public void fileDelete(ParameterMap param);
	
	public int count(SearchDTO search);
	public int totalCount(String gubun);
	public int isntYCount(String gubun);
	
	public FrontBoardJtDTO MainNews(String lang);
	
}
