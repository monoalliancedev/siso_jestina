package com.jt.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.domain.CategoryDTO;
import com.jt.domain.SearchDTO;
import com.jt.mapper.CategoryMapper;
import com.jt.service.CategoryService;
import com.jt.service.UploadFileService;
import com.jt.util.ParameterMap;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryMapper categoryMapper;
	
	@Autowired
	UploadFileService fileService;
	
	//로그
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	//-- 로그인 정보
	public AdmDTO AdminInfo() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO)principal;
	}
	
		
		//-- isntChange 
		@Override
		public void isntChange(ParameterMap param) {
			categoryMapper.isntChange(param);
			categoryMapper.isntChangePro(param);
		}
		//-- sortChange 
		@Override
		public void sortChange(ParameterMap param) {
			
			String changeSeq = param.getString("changeSeq");
			String changeKey = param.getString("changeKey");
			
			CategoryDTO category = categoryMapper.select(Integer.parseInt(changeSeq));
			int sortIdx = Integer.parseInt(category.getSortIdx());
			
			if(changeKey.equals("Up") || changeKey.equals("Down")) {
				
				//CHANGE 할 데이타 구함
				param.put("sortIdx", sortIdx);
				if(changeKey.equals("Up")) {
					category = categoryMapper.UpSelect(param); //검색정보 포함
				}else{
					category = categoryMapper.DownSelect(param);
				}
				
				//CHANGE
				param.put("seq", changeSeq);
				param.put("sortIdx", category.getSortIdx());
				categoryMapper.sortChange(param);
				
				param.put("seq", category.getSeq()); //up,down교체할 키값
				param.put("sortIdx", sortIdx);
				categoryMapper.sortChange(param);
			}	
		}

		
		//리스트
		@Override
		public List<CategoryDTO> list(SearchDTO search){
			return categoryMapper.list(search);
		}
		
		//전체 카테고리 리스트
		@Override
		public List<CategoryDTO> categoryList(){
			return categoryMapper.categoryList();
		}
	
		//-- 폼 등록 및 수정
		@Override
		public void insertAndUpdate(CategoryDTO category, HttpServletRequest request) {
			
			//-- admId setting
			category.setAdmId(AdminInfo().getAdm_id());
			
			//== Mapper
			categoryMapper.insertAndUpdate(category);
		}

		//-- 제품상세페이지에서 카테고리 등록
		@Override
		public void insert(HttpServletRequest request) {
			
			CategoryDTO category = new CategoryDTO();
			category.setSeq(0);
			category.setCateName(request.getParameter("cateName"));

			insertAndUpdate(category, request);
		}
		
		//-- Delete
		@Override
		public void delete(int seq) {
			categoryMapper.delete(seq);
		}	
		
		//-- View
		@Override
		public CategoryDTO select(int seq) {
			CategoryDTO category = categoryMapper.select(seq);
			return category;
		}
		
		
		@Override 
		public int count(SearchDTO search) {
			return categoryMapper.count(search);
		}


		@Override
		public int totalCount() {
			return categoryMapper.totalCount();
		}

		
		
		
		
		
		
		@Override
		public List<CategoryDTO> FrontSelect(int seq) {
			System.out.println("##################");
			return categoryMapper.FrontSelect(seq);
			
		}
}
