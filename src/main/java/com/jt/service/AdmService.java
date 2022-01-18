package com.jt.service;

import java.util.List;

import com.jt.domain.AdmDTO;
import com.jt.util.ParameterMap;


public interface AdmService {
    public void insertAdm (AdmDTO adm);
    public void updateAdm (AdmDTO adm);
    public void deleteAdm (String adm_id);
    public AdmDTO selectAdm (String adm_id);
    public List<AdmDTO> selectAdmList(ParameterMap param);
    public int selectAdmCount(ParameterMap param);

}
