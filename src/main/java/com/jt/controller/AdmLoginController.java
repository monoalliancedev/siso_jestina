package com.jt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdmLoginController {
	
	
	Logger log = LoggerFactory.getLogger(this.getClass());	
	
	
	//로그인
	@RequestMapping(value="/jtadm/login", method = {RequestMethod.POST, RequestMethod.GET})
	public String admLogin() {
		log.debug("################ 1234 = " + new BCryptPasswordEncoder().encode("1234"));
		return "adm/login_jt";
	}
	
	@GetMapping("/jtadm/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        if(authentication != null){
            new SecurityContextLogoutHandler().logout(request,response,authentication);
        }
        return "redirect:/jtadm/";
    }

	
}