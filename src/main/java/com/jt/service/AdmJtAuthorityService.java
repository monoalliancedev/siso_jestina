package com.jt.service;

import javax.servlet.http.HttpServletRequest;

public interface AdmJtAuthorityService {

	public void deleteAdmJtAuth(String adm_id);
    public void insertAdmJtAuth(HttpServletRequest request, String adm_id);

    public Integer getIsnt(String key) ;
	public String[] selectAdmJtAuth(String adm_id);
    public int selectAuthManager(String adm_id);
	
    
	/*
	public void  (AdmJtAuthorityDTO adm);
    public void updateAdm (AdmJtAuthorityDTO adm);
    public void deleteAdm (String adm_id);
    public AdmJtAuthorityDTO selectAdm (String adm_id);
    public List<AdmJtAuthorityDTO> selectAdmList(ParameterMap param);
    */

}