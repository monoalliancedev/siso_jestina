package com.jt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.domain.FaqDTO;
import com.jt.domain.SearchDTO;
import com.jt.mapper.FaqMapper;
import com.jt.service.FaqService;
import com.jt.util.ParameterMap;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqMapper FaqMapper;
	
	//로그인 정보
	public AdmDTO AdminInfo() {
	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO)principal;
	}
		
	@Override
	public void isntChange(ParameterMap param) {
		FaqMapper.isntChange(param);
	}	
		
	@Override
	public void insert(FaqDTO faq) {
		faq.setAdmId(AdminInfo().getAdm_id());
		FaqMapper.insert(faq);
	}

	@Override
	public void update(FaqDTO faq) {
		faq.setAdmId(AdminInfo().getAdm_id());
		FaqMapper.update(faq);
	}

	@Override
	public void delete(int seq) {
		FaqMapper.delete(seq);
	}

	@Override
	public FaqDTO select(int seq) {
		return FaqMapper.select(seq);
	}

	@Override
	public List<FaqDTO> list(SearchDTO search) {
		return FaqMapper.list(search);
	}

	@Override
	public int count(SearchDTO search) {
		return FaqMapper.count(search);
	}
	
	@Override 
	public int totalCount() {
		return FaqMapper.totalCount();
		
	}
	
	@Override
	public int isntYCount() {
		return FaqMapper.isntYCount();
	}
}
