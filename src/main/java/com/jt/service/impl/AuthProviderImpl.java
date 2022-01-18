package com.jt.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.jt.mapper.AdmMapper;
import com.jt.service.AuthProvider;

//@Component("authProvider")
public class AuthProviderImpl implements AuthProvider{
	
    @Autowired
    AdmMapper accountMapper;
    
    /*	
    //@Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        
    	String id = authentication.getName();
        //String password = authentication.getCredentials().toString();
        
        AdmDTO user = accountMapper.selectAdm(id);
        
        
        //System.out.println("등록 아이디 : ##################" + id);
        //String passwordcry = new BCryptPasswordEncoder().encode(password);
        //System.out.println("이게 뭐지요 : ##################$2a$10$PMD3dLlZBwzm9HZm7OTEf.KG2UVctExwkCf362AtecoiYFsRugcaq");
        //System.out.println("등록 비밀번호 : ##################" + password);
        //System.out.println("등록 비밀번호 암호 : ##################" + passwordcry);
        //System.out.println("DB 비밀번호 : ##################" + user.getPassword());
        
        // 로그인 실패
        if (null == user || !user.getAdm_id().equals(id)) {
        	System.out.println("##################로그인 정보가 틀려요.");
        	return null;
        
        // 로그인 성공
        }else {
        	System.out.println("##################로그인 정보가 마자요^^");
        	return authentication;
        }
    }
    
    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
    */
}