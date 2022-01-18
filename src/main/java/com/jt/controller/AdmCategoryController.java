package com.jt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jt.domain.AdmDTO;
import com.jt.domain.CategoryDTO;
import com.jt.domain.SearchDTO;
import com.jt.service.AdmJtAuthorityService;
import com.jt.service.CategoryService;
import com.jt.util.ComUtils;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;

@Controller
public class AdmCategoryController {
	
	// 권한키값(팝업),redirect
	private static final String authorityKey = "roman";
	private static final String authorityHome = "redirect:/jtadm/";
		
	@Autowired
	AdmJtAuthorityService admJtAuthService;
	
	@Autowired
	CategoryService categoryService;
	
		
		//로그인 정보
		@ModelAttribute("authAdm")
		public AdmDTO getAuthAdm() {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			return (AdmDTO)principal; 
		}

		
		//### NEW ARRIVALS 노출여부 변경
		@PostMapping(value="/jtadm/brand/romason/viewYN")
		public ModelAndView categoryViewYN(HttpServletRequest request
										, @ModelAttribute("search") SearchDTO search
										, RedirectAttributes ra ) throws Throwable{
				
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}
			
			ParameterMap map = new ParameterMap( request );
			categoryService.isntChange(map) ;
			
			ra.addFlashAttribute("search", search);
			mv.setViewName("redirect:/jtadm/brand/romason/romasonCate");
			return mv;
		}
		
		
		
		//### Sort 변경
		@PostMapping(value="/jtadm/brand/romason/sortProc")
		public ModelAndView sortProc(HttpServletRequest request
										, @ModelAttribute("search") SearchDTO search
										, RedirectAttributes ra ) throws Throwable{
						
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}
					
			ParameterMap map = new ParameterMap(request);
			map.put("key", search.getKey());
			map.put("keyword", search.getKeyword());
			map.put("keyValue1", search.getKeyValue1());
			
			categoryService.sortChange(map);

			ra.addFlashAttribute("search", search);
			mv.setViewName("redirect:/jtadm/brand/romason/romasonCate");
			return mv;
		}
				
		
		//### 리스트
		@GetMapping(value="/jtadm/brand/romason/romasonCate")
		public ModelAndView categoryList(@ModelAttribute("search") SearchDTO search
									, RedirectAttributes ra) throws Throwable{
				
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}
			
			//search에 총 글수를 넣어준다. 
			search.setTotal_rows(categoryService.count(search));
			
			//목록 받아오기(getPg_start()=0, getPg_end()=10, getKey(), getKeyword())
			List<CategoryDTO> list = categoryService.list(search) ;
			
			
			//mv addObject
			mv.addObject("totalCount", categoryService.totalCount()); 
			mv.addObject("categoryList", categoryService.categoryList());
			mv.addObject("list", list);		
			mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows()			/* 전체 low수 */ 
										, ComUtils.objToIntDef(search.getPg_rows(),10)  /* 페이지 당 레코드 수 => 없으면 10*/ 
										, ComUtils.objToIntDef(search.getCpage(),1)		/* 현재 페이지 => 없으면 1 */
										, 10, "이전페이지","다음페이지","첫페이지","마지막페이지","goPage"));
			mv.addObject("page", search) ;
			mv.setViewName("/adm/brand/romason/romasonCate");
			return mv;
		}	
		
		
		//### 등록 및 수정 Proc
		@PostMapping(value="/jtadm/brand/romason/categoryProc")
		public ModelAndView InsertUpdateProc(HttpServletRequest request
											, CategoryDTO category
											, @ModelAttribute("search") SearchDTO search
											, RedirectAttributes ra ) throws Throwable{
			
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}
			
			//-- Service 호출
			categoryService.insertAndUpdate(category, request);
			
			//-- mv,ra
			if(category.getSeq()>0) 
				ra.addFlashAttribute("msg", "updateOK"); //수정 성공여부
			else
				ra.addFlashAttribute("msg", "insertOK"); //등록 성공여부
			
			ra.addFlashAttribute("search", search);
			mv.setViewName("redirect:/jtadm/brand/romason/romasonCate");
			return mv;
		}
		
		
		//### 삭제 리스트
		@PostMapping(value="/jtadm/brand/romason/categoryDel")
		public ModelAndView categoryDel(Integer seq
									, @ModelAttribute("search") SearchDTO search
									, RedirectAttributes ra ) throws Throwable{
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}
			
			categoryService.delete(seq) ;
			
			ra.addFlashAttribute("msg", "deleteOK"); //성공여부
			mv.setViewName("redirect:/jtadm/brand/romason/romasonCate");
			return mv;
		}
		
		
		//### 제품 등록,수정폼 (카테고리 등록/데이타를 selectbox에 뿌림)
		@GetMapping(value="/jtadm/brand/romason/romasonCateProc")
		public @ResponseBody String romasonCateProc(HttpServletRequest request) throws Throwable{
			
			String categoryCode = "";
			String categoryName = "";
			
			//-- 카데고리 등록
			categoryService.insert(request);
			
			//카테고리 리스트 for code,name 값을 넣어준다.
			for (CategoryDTO cateList : categoryService.categoryList()) {
				categoryCode = categoryCode + "#####" + cateList.getSeq();
				categoryName = categoryName + "#####" + cateList.getCateName();
			}
			
			//성공했을때
			JSONObject data = new JSONObject();
			data.put("code", categoryCode);
			data.put("name", categoryName);
			
			return data.toString();
				
		}
		
		
		
		
		
		
		
		
		
		
		
		
		

}









