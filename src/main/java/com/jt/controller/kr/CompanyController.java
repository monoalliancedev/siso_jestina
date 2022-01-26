package com.jt.controller.kr;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller("CompanyController")
public class CompanyController {

	private static final String SiteLang= "KR";
	private static final String SiteFolder= "kr";
	
	//-- 회사 정보
	@GetMapping(value="/company/vision")
	public String vision() {
		return "/"+SiteFolder+"/company/vision";
	}
	
	@GetMapping(value="/company/history")
	public String history() {
		return "/"+SiteFolder+"/company/history";
	}
	
	@GetMapping(value="/company/business")
	public String business() {
		return "/"+SiteFolder+"/company/business";
	}
	
	@GetMapping(value="/company/bi")
	public String bi() {
		return "/"+SiteFolder+"/company/bi";
	}
	
	@GetMapping(value="/company/contact")
	public String contact() {
		return "/"+SiteFolder+"/company/contact";
	}
	
	
}
