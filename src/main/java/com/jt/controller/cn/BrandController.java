package com.jt.controller.cn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jt.domain.CategoryDTO;
import com.jt.domain.FrontCategoryDTO;
import com.jt.domain.FrontMuseDTO;
import com.jt.domain.RomasonDTO;
import com.jt.domain.UploadFileDTO;
import com.jt.service.BrandBannerService;
import com.jt.service.CategoryService;
import com.jt.service.MuseService;
import com.jt.service.RomasonService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.Constants;
import com.jt.util.ParameterMap;


@Controller("CNBrandController")   
public class BrandController {

	@Autowired
	BrandBannerService brandBannerService;
	
	@Autowired
	MuseService museService;
	
	@Autowired
	RomasonService romasonService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	UploadFileService ufService;
	
	
	private static final String SiteLang= "CN";
	private static final String SiteFolder= "cn";
		
	//-- 브랜드 쥬얼리
	@GetMapping(value="/"+SiteFolder+"/brand/jewelry")
	public ModelAndView jewerly() throws Throwable{
		
		String gubun = Constants.arrGubun[0];
		ParameterMap map = new ParameterMap();
		map.put("lang", SiteLang); //언어
		map.put("gubun", gubun);//카테고리

		ModelAndView mv = new ModelAndView();
		mv.addObject("brandBanner", brandBannerService.FrontSelect(map));
		mv.addObject("fileFolder", gubun);
		mv.setViewName("/"+SiteFolder+"/brand/jewelry");
		return mv;
	}
	
	//-- 브랜드 핸드백
	@GetMapping(value="/"+SiteFolder+"/brand/handbag")
	public ModelAndView handbag() throws Throwable{
		
		String gubun = Constants.arrGubun[1];
		ParameterMap map = new ParameterMap();
		map.put("lang", SiteLang); //언어
		map.put("gubun", gubun);//카테고리

		ModelAndView mv = new ModelAndView();
		mv.addObject("brandBanner", brandBannerService.FrontSelect(map));
		mv.addObject("fileFolder", gubun);
		mv.setViewName("/"+SiteFolder+"/brand/handbag");
		return mv;
	}
	
	//-- 브랜드 로만손 제품 리스트
	@GetMapping(value="/"+SiteFolder+"/brand/romanson")
	public ModelAndView romasonList(String cateCode) throws Throwable {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("cateCode", ComUtils.StrToInt(cateCode)); //카테고리키값
		mv.setViewName("/"+SiteFolder+"/brand/romansonList");
		return mv;
	}
	
	@GetMapping(value="/"+SiteFolder+"/brand/romansonInfo")
	public @ResponseBody String romasonList(int cateCode) throws Throwable{
		
		//int cateSeq = ComUtils.StrToInt(cateCode);
		int cateSeq =cateCode;
		
		//카테고리정보(이전,다음)
		//List<CategoryDTO> cateInfo = new ArrayList<>();
		FrontCategoryDTO frontCate = new FrontCategoryDTO();
		
		//상품리스트
		List<RomasonDTO> proList = new ArrayList<>(); 
		//카테고리리스트,첫카테고리선택
		List<CategoryDTO> cateList = categoryService.categoryList();
		
		
		//이전,다음
		//NEW ARRIVALS(추천 신상품)
		if(cateSeq==0) {
			frontCate.setSeq(0); //현재카테고리
			frontCate.setCateName("NEW ARRIVALS");
			frontCate.setPreSeq(0); //이전카테고리 : 없음
			frontCate.setPreCateName("");
			frontCate.setNextSeq(cateList.get(0).getSeq()); //다음카테고리 : 첫카테고리
			frontCate.setNextCateName(cateList.get(0).getCateName());

			proList = romasonService.FrontNewList();
		}else{
			
			frontCate = categoryService.FrontSelect(cateSeq);
			
			if(cateSeq==cateList.get(0).getSeq()) { //첫번째 카테고리일때
				frontCate.setPreSeq(0); 	//이전카테고리 : NEW ARRIVALS
				frontCate.setPreCateName("NEW ARRIVALS");
			}

			proList = romasonService.FrontList(cateSeq);
		}
		
		JSONObject jsonData = new JSONObject();
		
		jsonData.put("rs", "Y");
		jsonData.put("fileFolder", "Product"); //상품폴더
		jsonData.put("cateCode", cateCode); //카테고리키값
		jsonData.put("list", proList); //상품리스트
		jsonData.put("categoryList", cateList); //카테고리 리스트
		//jsonData.put("frontCate", frontCate); //카테고리이전,다음정보
		jsonData.put("Seq", frontCate.getSeq());
		jsonData.put("CateName", frontCate.getCateName()); 
		jsonData.put("PreSeq", frontCate.getPreSeq()); 
		jsonData.put("PreCateName", frontCate.getPreCateName()); 
		jsonData.put("NextSeq", frontCate.getNextSeq()); 
		jsonData.put("NextCateName", frontCate.getNextCateName()); 

		return jsonData.toString();		
		
	}
	
	
	
	
	
	

	//-- 브랜드 로만손 제품 상세정보
	@GetMapping(value="/"+SiteFolder+"/brand/romansonView")
	public ModelAndView romansonView(String code,String cateCode) throws Throwable {
		
		ParameterMap map = new ParameterMap();
		map.put("cateCode", cateCode); //카테고리 Code
		map.put("code", code); //상품 code
		
		RomasonDTO romason = romasonService.FrontSelect(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("cateCode", cateCode); //카테고리
		mv.addObject("fileFolder", "Product"); //상품폴더
		mv.addObject("romason", romason); //제품정보
		mv.setViewName("/"+SiteFolder+"/brand/romansonView");
		return mv;
	}
	
	//-- 브랜드 뮤즈
	@GetMapping(value="/"+SiteFolder+"/brand/archive")
	public ModelAndView archive() throws Throwable {
		
		ParameterMap map = new ParameterMap();  // request
		HashMap<String,List<FrontMuseDTO>> museAndYearList = new HashMap<String,List<FrontMuseDTO>>();
		HashMap<Integer,List<UploadFileDTO>> museAndFileList = new HashMap<Integer,List<UploadFileDTO>>();
		
		//뮤즈 정보가 있는 년도를 불러온다.
		for(String year : museService.FrontYearlist(SiteLang)){

			List<FrontMuseDTO> museList = museService.Frontlist(SiteLang,year);
			museAndYearList.put(year,museList); //년도별 뮤즈리스트를 넣는다.
		
			for(FrontMuseDTO muse : museList){
				//한 뮤즈에 이미지 정보를 불러온다.
				String pseq = muse.getSeq() + "-" + SiteLang;
				map.put("pseq", pseq);
				map.put("gubun", "muse");
				List<UploadFileDTO> fileList = ufService.list(map);
				
				museAndFileList.put(muse.getSeq(),fileList); //뮤즈코드별 이미지 리스트를 넣는다.
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("fileFolder", "muse"); //이미지폴더
		mv.addObject("museAndFileList", museAndFileList);
		mv.addObject("museAndYearList", museAndYearList);
		mv.setViewName("/"+SiteFolder+"/brand/archive");
		return mv;
	}
	
}
