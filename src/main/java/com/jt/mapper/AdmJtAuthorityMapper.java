package com.jt.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jt.util.ParameterMap;

@Mapper
public interface AdmJtAuthorityMapper {
	
	int count(ParameterMap param);
	void insertAdmJtAuth(ParameterMap param); 
	void deleteAdmJtAuth(String adm_id);
	String[] selectAdmJtAuth(String adm_id);	
}
