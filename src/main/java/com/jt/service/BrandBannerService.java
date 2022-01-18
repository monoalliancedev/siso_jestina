package com.jt.service;

import com.jt.domain.BrandBannerDTO;
import com.jt.domain.FrontBannerDTO;
import com.jt.util.ParameterMap;


public interface BrandBannerService {

	public BrandBannerDTO list(BrandBannerDTO banner);
	public void BBannerProc(BrandBannerDTO banner);
	public void fileUpdate(ParameterMap param);
	
	
	
	public FrontBannerDTO FrontSelect(ParameterMap param);	
}
