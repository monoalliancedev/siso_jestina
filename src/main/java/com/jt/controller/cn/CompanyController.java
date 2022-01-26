package com.jt.controller.cn;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller("CNCompanyController")
public class CompanyController {

	//private static final String SiteLang= "CN";
	private static final String SiteFolder= "cn";
	
	//-- 회사 정보
	@GetMapping(value="/"+SiteFolder+"/company/vision")
	public String vision() {
		return "/"+SiteFolder+"/company/vision";
	}
	
	@GetMapping(value="/"+SiteFolder+"/company/history")
	public String history() {
		return "/"+SiteFolder+"/company/history";
	}
	
	@GetMapping(value="/"+SiteFolder+"/company/business")
	public String business() {
		return "/"+SiteFolder+"/company/business";
	}
	
	@GetMapping(value="/"+SiteFolder+"/company/bi")
	public String bi() {
		return "/"+SiteFolder+"/company/bi";
	}
	
	@GetMapping(value="/"+SiteFolder+"/company/contact")
	public String contact() {
		return "/"+SiteFolder+"/company/contact";
	}
	
	
}
