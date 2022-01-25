package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.FrontPopupJtDTO;
import com.jt.domain.PopupJtDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  PopupMapper {

	void insertAndUpdate(PopupJtDTO popupJtDTO);
	void delete(int seq);
	
	PopupJtDTO select(int seq);	
	List<PopupJtDTO> list(SearchDTO search);
	
	int count(SearchDTO search);
	int totalCount();
	int isntYCount();
	
	void isntChangePopup(ParameterMap param);
	void fileUpdatePopup(ParameterMap param);
	
	
	//Front
	public List<FrontPopupJtDTO> MainPopup(String lang);
	
}
