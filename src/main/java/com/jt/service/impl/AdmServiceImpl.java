package com.jt.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.mapper.AdmMapper;
import com.jt.service.AdmService;
import com.jt.util.ParameterMap;

@Service
public class AdmServiceImpl implements AdmService {
	@Autowired
	private AdmMapper admMapper;
	
	@Override
	public void insertAdm(AdmDTO adm) {
		admMapper.insertAdm(adm);
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAdm(AdmDTO adm) {
		// TODO Auto-generated method stub
		admMapper.updateAdm(adm);

	}

	@Override
	public void deleteAdm(String adm_id) {
		// TODO Auto-generated method stub
		admMapper.deleteAdm(adm_id);

	}

	@Override
	public AdmDTO selectAdm(String adm_id) {
		// TODO Auto-generated method stub
		return admMapper.selectAdm(adm_id);
	}

	@Override
	public List<AdmDTO> selectAdmList(ParameterMap param) {
		// TODO Auto-generated method stub
		return admMapper.selectAdmList(param);
	}

	@Override
	public int selectAdmCount(ParameterMap param) {
		// TODO Auto-generated method stub
		return admMapper.selectAdmCount(param);
	}

}
