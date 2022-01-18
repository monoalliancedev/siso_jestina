package com.jt.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class AuthSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
 
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws ServletException, IOException {
    	
    	System.out.println("@@@@@@@@" + authentication.toString());
 
        response.setStatus(HttpServletResponse.SC_OK);
        response.sendRedirect("/jtadm/");
        // 성공 시 response를 json형태로 반환
        //response.getWriter().print("{\"success\": true}");
        //response.getWriter().flush();
    }
 
}
