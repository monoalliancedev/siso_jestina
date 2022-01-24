package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.BannerDTO;
import com.jt.domain.FrontBannerDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  BannerMapper {

	void insert(BannerDTO bannerDTO);
	void update(BannerDTO bannerDTO);
	void delete(int seq);
	void MBBannerProc(BannerDTO bannerDTO);
	
	BannerDTO select(int seq);	
	BannerDTO selectGubun(String gubun);
	List<BannerDTO> list(SearchDTO search);
	
	int count(SearchDTO search);
	int totalCount(String gubun);
	int isntYCount(String gubun);
	
	int max_seq(ParameterMap param);
	void fileUpdate(ParameterMap param);
	
	void isntChange(ParameterMap param);
	void sortChange(ParameterMap param);
	
	//BannerDTO UpSelect(int sortIdx);
	//BannerDTO DownSelect(int sortIdx);
	BannerDTO UpSelect(ParameterMap param);
	BannerDTO DownSelect(ParameterMap param);
	
	
	List<FrontBannerDTO> MainBanner(String lang);
	FrontBannerDTO MainBarndBanner(ParameterMap param);
	
}
