package com.jt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jt.domain.BannerDTO;
import com.jt.domain.FrontBannerDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;


public interface BannerService {

	public void insert(BannerDTO banner, HttpServletRequest request);
	public void update(BannerDTO banner, HttpServletRequest request);
	public void delete(int seq);
	public void MBBannerProc(BannerDTO bannerDTO);
	
	public BannerDTO selectGubun(String gubun);
	public BannerDTO select(int seq);	
	public List<BannerDTO> list(SearchDTO search);
	
	public int count(SearchDTO search);
	public int totalCount(String gubun);
	int isntYCount(String gubun);
	
	public int max_seq(ParameterMap param);
	public void fileDelete(ParameterMap param);
	
	public void isntChange(ParameterMap param);
	public void sortChange(ParameterMap param);
	
	
	
	public List<FrontBannerDTO> MainBanner(String lang);
	public FrontBannerDTO MainBarndBanner(ParameterMap param);
	
	
	
	
	
}


















