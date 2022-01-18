package com.jt.service;

import java.util.List;

import com.jt.domain.FaqDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

public interface FaqService {

	public void insert(FaqDTO faq);
	public void update(FaqDTO faq);
	public void delete(int seq);
	
	public FaqDTO select(int seq);	
	public List<FaqDTO> list(SearchDTO search);
	
	public void isntChange(ParameterMap param);
	
	public int count(SearchDTO search);
	public int totalCount();
	public int isntYCount();
	
}
