package com.jt.service;

import java.util.List;

import com.jt.domain.RecruitmentDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;


public interface RecruitmentService {

	public void insert(RecruitmentDTO recruitmentDTO);
	public void update(RecruitmentDTO recruitmentDTO);
	public void delete(int seq);
	
	public RecruitmentDTO select(int seq);	
	public List<RecruitmentDTO> list(SearchDTO search);
	
	public int max_seq(ParameterMap param);
	public void isntChange(ParameterMap param);
	
	public int count(SearchDTO search);
	public int totalCount();
	public int isntYCount();
	
	
	public List<RecruitmentDTO> FrontList(String careerIsnt);
	int FrontTotalCnt(String careerIsnt);

}
