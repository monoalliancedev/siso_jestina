package com.jt.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;
 
/**
 * 로그인 실패 핸들러
 * 
 * @author wedul
 *
 */
@Component
public class AuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {
    
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
            AuthenticationException exception) throws IOException, ServletException {
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        
        System.out.println("################## 로그인 실패! 다시 로그인해주세요.");
        request.setAttribute("errorMsg", "Fail");
        request.getRequestDispatcher("/jtadm/login").forward(request, response); //실패메세지를 가지고 가요.
        
        
        
        // 실패 시 response를 json 형태로 결과값 전달
        //response.getWriter().print("{\"success\": false}");
        //response.getWriter().flush();
    }
}



