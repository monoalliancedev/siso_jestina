package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.AdmDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  AdmJtMapper {

	void insertAdmAuthority(String adm_id);
	void insertPopAdm(AdmDTO account);
	void updatePop2Adm(AdmDTO account);
	void updatePopAdm(AdmDTO account);
	void deleteAdm(String adm_id);
	void deleteAdmAuthority(String adm_id);
	
	List<AdmDTO> selectAdmList(SearchDTO search);
	List<String> getAdmAuthorites(String adm_id);
	AdmDTO selectPopAdm(String adm_id);
	
	int selectCnt(SearchDTO search);
	int totalCount();
		
	
	//-----------------------------------------------
	void insertAdm(AdmDTO account);
	void updateAdm(AdmDTO account);
	
	AdmDTO selectAdm(String adm_id);	
	int selectAdmCount(ParameterMap param);
	void changeEnabled(String adm_id);
}
