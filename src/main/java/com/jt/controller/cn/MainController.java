package com.jt.controller.cn;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jt.domain.FrontBannerDTO;
import com.jt.domain.FrontBoardJtDTO;
import com.jt.domain.FrontPopupJtDTO;
import com.jt.service.BannerService;
import com.jt.service.BoardJtService;
import com.jt.service.PopupService;
import com.jt.util.Constants;
import com.jt.util.ParameterMap;


@Controller("CNMainController")
public class MainController {

	@Autowired
	BoardJtService boardJtService;
	
	@Autowired
	BannerService bannerService;
	
	@Autowired
	PopupService popupService;
	
	
	private static final String SiteLang= "CN";
	private static final String SiteFolder= "cn";
		
	//-- 메인
	@GetMapping(value="/"+SiteFolder+"/")
	public ModelAndView krIndex() throws Throwable{
		
		ParameterMap map = new ParameterMap();
		map.put("lang", SiteLang);
		
		//NEWS 
		FrontBoardJtDTO mainNews = boardJtService.MainNews(SiteLang);
		
		//메인배너
		List<FrontBannerDTO> mainBannerList = bannerService.MainBanner(SiteLang);

		//메인브랜드 배너
		map.put("gubun", Constants.arrGubun[0]);  //쥬얼리
		FrontBannerDTO mainBarndJ = bannerService.MainBarndBanner(map);
		map.put("gubun", Constants.arrGubun[1]);  //가방
		FrontBannerDTO mainBarndB = bannerService.MainBarndBanner(map);
		map.put("gubun", Constants.arrGubun[2]);  //로만손
		FrontBannerDTO mainBarndR = bannerService.MainBarndBanner(map);
		
		//메인팝업
		List<FrontPopupJtDTO> MainPopupList = popupService.MainPopup(SiteLang) ;
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("mainNews", mainNews);
		mv.addObject("mainBannerList", mainBannerList);
		mv.addObject("mainBarndJ", mainBarndJ);
		mv.addObject("mainBarndB", mainBarndB);
		mv.addObject("mainBarndR", mainBarndR);
		mv.addObject("MainPopupList", MainPopupList);
		
		mv.addObject("SiteFolder", SiteFolder);
		mv.setViewName("/"+SiteFolder+"/index");
		return mv;
	}
	
	
}
