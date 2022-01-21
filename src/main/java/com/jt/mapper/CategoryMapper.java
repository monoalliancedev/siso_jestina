package com.jt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jt.domain.CategoryDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;

@Mapper
public interface  CategoryMapper {

	void insertAndUpdate(CategoryDTO romason);
	void delete(int seq);
	
	CategoryDTO select(int seq);	
	List<CategoryDTO> list(SearchDTO search);
	List<CategoryDTO> categoryList();
	
	int count(SearchDTO search);
	int totalCount();
	
	void isntChange(ParameterMap param);
	void isntChangePro(ParameterMap param);
	void sortChange(ParameterMap param);
	
	CategoryDTO UpSelect(ParameterMap param);
	CategoryDTO DownSelect(ParameterMap param);
	
	
}
