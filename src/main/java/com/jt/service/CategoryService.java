package com.jt.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.jt.domain.CategoryDTO;
import com.jt.domain.SearchDTO;
import com.jt.util.ParameterMap;


public interface CategoryService {

	public void insertAndUpdate(CategoryDTO banner, HttpServletRequest request);
	public void insert(HttpServletRequest request);
	public void delete(int seq);

	public CategoryDTO select(int seq);	
	public List<CategoryDTO> list(SearchDTO search);
	public List<CategoryDTO> categoryList();
	
	public int count(SearchDTO search);
	public int totalCount();
	
	public void isntChange(ParameterMap param);
	public void sortChange(ParameterMap param);
	
	
	public List<CategoryDTO> FrontSelect(int cateSeq);
	
}
