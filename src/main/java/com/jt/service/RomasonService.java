package com.jt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jt.domain.RomasonDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;


public interface RomasonService {

	public void insertAndUpdate(RomasonDTO banner, HttpServletRequest request);
	public void delete(int seq);

	public RomasonDTO select(int seq);	
	public List<RomasonDTO> list(SearchDTO search);
	
	public int count(SearchDTO search);
	public int totalCount();
	int isntYCount();
	
	public void isntChange(ParameterMap param);
	public void fileUpdate(ParameterMap param);
	
	
	public List<RomasonDTO> FrontNewList();
	public List<RomasonDTO> FrontList(int category);
	public RomasonDTO FrontSelect(ParameterMap param);
	
	
	
}
