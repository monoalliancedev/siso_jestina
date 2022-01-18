package com.jt.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jt.domain.AdmDTO;
import com.jt.domain.BrandBannerDTO;
import com.jt.service.AdmJtAuthorityService;
import com.jt.service.BrandBannerService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.ParameterMap;

@Controller
public class AdmBrandController {
	
	// 권한키값(팝업),redirect
	private static final String authorityKey = "banner";
	private static final String authorityHome = "redirect:/jtadm/";
			
	@Autowired
	AdmJtAuthorityService admJtAuthService;
		
	@Autowired
	BrandBannerService brandBannerService;
		
	@Autowired
	UploadFileService fileService;
		
		
	//로그인 정보
	@ModelAttribute("authAdm")
	public AdmDTO getAuthAdm() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO)principal; 
	}


	//### 수정폼
	@GetMapping(value="/jtadm/brand/banner/list{lang}")
	public ModelAndView BbannerView(@PathVariable String lang, RedirectAttributes ra) throws Throwable{
				
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}
				
		List<BrandBannerDTO> banner = new ArrayList<BrandBannerDTO>();
		String[] arrGubun = new String[]{"Jewerly","Bag","Romason"};
		
		BrandBannerDTO BB = new BrandBannerDTO();
		BB.setLang(lang); //언어
		
		for(int i=0; i<arrGubun.length;i++) {
			
			BB.setGubun(arrGubun[i]); //카테고리
			
			BrandBannerDTO bannerDto1 = new BrandBannerDTO(); //비어있는 bannerDTO
			BrandBannerDTO bannerDto2 = brandBannerService.list(BB); //DB에서 받아온 bannerDTO 
		
			if(!ComUtils.isEmpty(bannerDto2)) { 
				bannerDto1 = bannerDto2; //DB내용이 있으면
			}
			banner.add(bannerDto1);
			//System.out.println("############ " + banner.toString());
		}
				
		mv.addObject("arrGubun", arrGubun);
		mv.addObject("banner", banner);
		mv.setViewName("/adm/brand/banner/list");
		return mv;
	}	
			
	//### 배너 저장(수정 및 등록)
	@PostMapping(value="/jtadm/brand/banner/BrandBannerProc")
	public ModelAndView bannerProc(BrandBannerDTO banner, RedirectAttributes ra) throws Throwable{
				
		// ** 권한 여부에 따른 페이지 이동
					ModelAndView mv = new ModelAndView();
					if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
						ra.addFlashAttribute("msg", "authorityKeyFalse");
						mv.setViewName(authorityHome);
						return mv;
					}
				
		//-- Service 호출
		brandBannerService.BBannerProc(banner);
		//-- mv,ra
		ra.addFlashAttribute("msg", "insertOK"); //성공여부
		mv.setViewName("redirect:/jtadm/brand/banner/list"+banner.getLang());
		return mv;
	}
	
	
	//### 삭제(수정폼에서 파일 개별 삭제)
	@GetMapping(value="/jtadm/brand/banner/fileDel")
	public @ResponseBody String FileDel(HttpServletRequest request) throws Throwable{
		
		ParameterMap map = new ParameterMap( request );
				
		brandBannerService.fileUpdate(map);
				
		//성공했을때
		JSONObject jsonData = new JSONObject();
		jsonData.put("key", map.getString("key")); //파일위치(0~4)
		jsonData.put("gubun", map.getString("gubun")); 
			
		return jsonData.toString();		
	}
	
	
			
}









