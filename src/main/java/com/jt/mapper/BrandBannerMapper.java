package com.jt.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.BrandBannerDTO;
import com.jt.domain.FrontBannerDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface BrandBannerMapper {

	void delete(int seq);
	BrandBannerDTO list(BrandBannerDTO banner);
	void fileUpdate(ParameterMap param);
	void BBannerProc(BrandBannerDTO banner);
	
	FrontBannerDTO FrontSelect(ParameterMap param);
}
