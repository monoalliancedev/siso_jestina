package com.jt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.jt.domain.AdmDTO;
import com.jt.service.AdmJtAuthorityService;

@Controller
public class AdmComonController {
		
	@Autowired
	AdmJtAuthorityService admJtAuthService;

	//로그인 정보
	@ModelAttribute("authAdm")
	public AdmDTO getAuthAdm() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO)principal; 
	}
			
	@GetMapping(value="/jtadm/")
	public String admIndex(Model model) {
		
		if (admJtAuthService.getIsnt("MBbanner") == 0) { // 권한 없음
			return "/adm/index_jt";
		}else {
			return "redirect:/jtadm/basic/Mbanner/list";
		}
		
		//return "/adm/basic/Mbanner/list";
	}
	
	
}


