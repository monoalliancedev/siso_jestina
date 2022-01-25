package com.jt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jt.domain.FrontPopupJtDTO;
import com.jt.domain.PopupJtDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

public interface PopupService {

	public void insertAndUpdate(PopupJtDTO banner, HttpServletRequest request);
	public void delete(int seq);
	public PopupJtDTO select(int seq);	
	public List<PopupJtDTO> list(SearchDTO search);
	
	public int count(SearchDTO search);
	public int totalCount();
	
	public void isntChangePopup(ParameterMap param);
	public void fileDeletePopup(ParameterMap param);
	
	public int isntYCount(); //게시여부 Y 갯수
	
	
	
	//Front
	public List<FrontPopupJtDTO> MainPopup(String lang);
}
