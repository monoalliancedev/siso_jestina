package com.jt.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.domain.RecruitmentDTO;
import com.jt.domain.SearchDTO;
import com.jt.mapper.RecruitmentMapper;
import com.jt.service.RecruitmentService;
import com.jt.util.ParameterMap;

@Service
public class RecruitmentServiceImpl implements RecruitmentService {
	
	@Autowired
	private RecruitmentMapper recruitmentMapper;
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	
	//로그인 정보
	public AdmDTO AdminInfo() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO)principal;
	}
	
	
	@Override
	public void isntChange(ParameterMap param) {
		recruitmentMapper.isntChange(param);
	}


	//리스트
	@Override
	public List<RecruitmentDTO> list(SearchDTO search){
		return recruitmentMapper.list(search);
	}

	//등록
	@Override
	public void insert(RecruitmentDTO recruitmentDTO) {
		recruitmentDTO.setAdmId(AdminInfo().getAdm_id());
		recruitmentMapper.insert(recruitmentDTO);
	}

	@Override
	public void update(RecruitmentDTO recruitmentDTO) {
		recruitmentDTO.setAdmId(AdminInfo().getAdm_id());
		recruitmentMapper.update(recruitmentDTO);
	}

	
	
	@Override
	public void delete(int seq) {
		recruitmentMapper.delete(seq);
	}

	
	
	@Override
	public RecruitmentDTO select(int seq) {
		return recruitmentMapper.select(seq);
		
	}
	
	
	@Override 
	public int count(SearchDTO search) {
		return recruitmentMapper.count(search);
		
	}
	@Override 
	public int totalCount() {
		return recruitmentMapper.totalCount();
		
	}

	@Override
	public int max_seq(ParameterMap param) {
		return recruitmentMapper.max_seq(param);
	}
	
	@Override
	public int isntYCount() {
		return recruitmentMapper.isntYCount();
	}


	@Override
	public List<RecruitmentDTO> FrontList(String careerIsnt) {
		return recruitmentMapper.FrontList(careerIsnt);
	}


	@Override
	public int FrontTotalCnt(String careerIsnt) {
		return recruitmentMapper.FrontTotalCnt(careerIsnt);
	}
}
