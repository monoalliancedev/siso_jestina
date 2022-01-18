package com.jt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jt.domain.FrontMuseDTO;
import com.jt.domain.MuseDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;


public interface MuseService {

	public void insertAndUpdate(MuseDTO muse, HttpServletRequest request);
	public void delete(int seq);
	
	public MuseDTO select(int seq);	
	public List<MuseDTO> list(SearchDTO search);
	public List<FrontMuseDTO> Frontlist(String lang, String year);
	public List<String> FrontYearlist(String lang); 
	
	public int count(SearchDTO search);
	public int totalCount();
	public int isntYCount();
	
	public void isntChange(ParameterMap param);
	

}
