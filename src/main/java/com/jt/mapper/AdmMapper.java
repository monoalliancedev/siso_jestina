package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.AdmDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  AdmMapper {

	void insertAdm(AdmDTO account);
	void updateAdm(AdmDTO account);
	void deleteAdm(String adm_id);
	AdmDTO selectAdm(String adm_id);	
	List<AdmDTO> selectAdmList(ParameterMap param);
	int selectAdmCount(ParameterMap param);
	
	void insertAdmAuthority(String adm_id, String authority_name);
	List<String> getAdmAuthorites(String adm_id);	
	void changeEnabled(String adm_id);
		

}
