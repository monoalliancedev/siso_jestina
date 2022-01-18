package com.jt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.domain.SearchDTO;
import com.jt.mapper.AdmJtMapper;
import com.jt.service.AdmJtService;
import com.jt.util.ComUtils;
import com.jt.util.ParameterMap;

@Service
public class AdmJtServiceImpl implements AdmJtService {
	@Autowired
	private AdmJtMapper admJtMapper;
	
	
	//TOP 회원 내정보 수정
	@Override
	public void updatePopAdm(ParameterMap map) {
			
		AdmDTO admDTO = new AdmDTO();
		String adm_pw1 = ComUtils.objToStr(map.get("pop_pw"));
		String adm_pw2 = ComUtils.objToStr(map.get("pop_pw_comfirm"));
		
		if(adm_pw1.equals(adm_pw2) && (!adm_pw1.equals(""))) {
			
			String sec_pw1 = new BCryptPasswordEncoder().encode(adm_pw1); //비밀번호 암호화
			admDTO.setAdm_pw(sec_pw1);	
			
		}else {
			admDTO.setAdm_pw("");	
		}
		
		admDTO.setAdm_id(ComUtils.objToStr(map.get("admId")));
		admDTO.setDepartment(ComUtils.objToStr(map.get("department")));
		admDTO.setHp(ComUtils.objToStr(map.get("hp")));
		admJtMapper.updatePopAdm(admDTO);
	}
		
	//회원리스트 정보 수정
	@Override
	public void updatePop2Adm(AdmDTO admDto, ParameterMap map) {
		
		String adm_pw1 = ComUtils.objToStr(map.get("adm_pw1"));
		String adm_pw2 = ComUtils.objToStr(map.get("adm_pw2"));
		String updateID = ComUtils.objToStr(map.get("updateID"));
		
		admDto.setAdm_id(updateID);
		
		if(adm_pw1.equals(adm_pw2) && (!adm_pw1.equals(""))) {
			
			String sec_pw1 = new BCryptPasswordEncoder().encode(adm_pw1); //비밀번호 암호화
			admDto.setAdm_pw(sec_pw1);	
			
		}else {
			admDto.setAdm_pw("");	
		}
		//System.out.println(admDto.getAdm_pw() + "#########" + admDto.getAdm_pw());
		
		admJtMapper.updatePop2Adm(admDto);
	}

	//회원리스트 정보 가입
	@Override
	public void insertPopAdm(AdmDTO admDto) {
		
		String adm_pw1 = new BCryptPasswordEncoder().encode(admDto.getAdm_pw()); //비밀번호 암호화
		admDto.setAdm_pw(adm_pw1);	
		
		admJtMapper.insertPopAdm(admDto); //회원등록
		admJtMapper.insertAdmAuthority(admDto.getAdm_id()); //회원Roll등록
	}
	
	//회원 삭제
	@Override
	public void deleteAdm(String adm_id) {
		admJtMapper.deleteAdm(adm_id); //회원삭제
		admJtMapper.deleteAdmAuthority(adm_id); //회원ROLL삭제
	}
	
	//회원 수정폼 데이타
	@Override
	public AdmDTO selectPopAdm(String adm_id) {
		return admJtMapper.selectPopAdm(adm_id);
	}
	
	//회원 목록
	@Override
	public List<AdmDTO> selectAdmList(SearchDTO search) {
		return admJtMapper.selectAdmList(search);
	}
	
	
	
	
	
	
	@Override
	public void insertAdm(AdmDTO adm) {
		admJtMapper.insertAdm(adm);
	}

	@Override
	public void updateAdm(AdmDTO adm) {
		admJtMapper.updateAdm(adm);
	}

	@Override
	public AdmDTO selectAdm(String adm_id) {
		return admJtMapper.selectAdm(adm_id);
	}

	@Override
	public int selectAdmCount(ParameterMap param) {
		return admJtMapper.selectAdmCount(param);
	}
	
	@Override
	public int selectCnt(SearchDTO search) {
		return admJtMapper.selectCnt(search);
	}

	@Override 
	public int totalCount() {
		return admJtMapper.totalCount();
		
	}

	
	
	
	
	
	
	
}
