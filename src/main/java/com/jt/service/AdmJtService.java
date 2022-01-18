package com.jt.service;

import java.util.List;

import com.jt.domain.AdmDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;


public interface AdmJtService {
    
	public void insertAdm (AdmDTO adm);
	public void updateAdm (AdmDTO adm);
    public AdmDTO selectAdm (String adm_id);
    public int selectAdmCount(ParameterMap param);
    
    
    
    
    public void insertPopAdm (AdmDTO adm); //회원팝업 - 회원가입
    public void updatePopAdm (ParameterMap map); //myPage팝업 - 수정
    public void updatePop2Adm (AdmDTO adm, ParameterMap map); //회원팝업 - 수정Proc
    public void deleteAdm (String adm_id); //회원,회원ROLL 삭제
    
    
    public int selectCnt(SearchDTO search); //검색 총 갯수
    public int totalCount(); //총갯수
    
    public List<AdmDTO> selectAdmList(SearchDTO search); //회원 리스트
    public AdmDTO selectPopAdm (String adm_id); //회원팝업 - 수정Form 정보 
}
