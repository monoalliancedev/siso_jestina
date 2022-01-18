package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.RecruitmentDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  RecruitmentMapper {

	void insert(RecruitmentDTO recruitmentDTO);
	void update(RecruitmentDTO recruitmentDTO);
	void delete(int seq);
	
	RecruitmentDTO select(int seq);	
	List<RecruitmentDTO> list(SearchDTO search);
	
	int max_seq(ParameterMap param);
	void isntChange(ParameterMap param);
	
	int count(SearchDTO search);
	int totalCount();
	int isntYCount();
	
	List<RecruitmentDTO> FrontList(String careerIsnt);
	int FrontTotalCnt(String careerIsnt);
	

}
