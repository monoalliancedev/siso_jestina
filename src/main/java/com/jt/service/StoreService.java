package com.jt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jt.domain.SearchDTO;
import com.jt.domain.StoreDTO;
import com.jt.util.ParameterMap;

public interface StoreService {

	public void insertAndUpdate(StoreDTO store, HttpServletRequest request);
	public void delete(int seq);
	
	public StoreDTO select(int seq);	
	public List<StoreDTO> list(SearchDTO search, String gubun);
	
	public int count(SearchDTO search, String gubun);
	public int totalCount(String gubun);
	
	public void sortChange(ParameterMap param);
}

