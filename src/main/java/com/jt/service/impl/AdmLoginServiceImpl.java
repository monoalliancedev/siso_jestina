package com.jt.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.mapper.AdmMapper;
import com.jt.service.AdmLoginService;

@Service
public class AdmLoginServiceImpl implements AdmLoginService{
	
	@Autowired
	//AdmAccountRepository accountsRepo;
	AdmMapper accountMapper;
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
    @Override
	public PasswordEncoder passwordEncoder() {
		return this.passwordEncoder;
	}
    
	@Override
	public UserDetails loadUserByUsername(String adm_id) throws UsernameNotFoundException {
		
		log.info("## loadUserByUsername ##");
		log.info(adm_id);
		
		AdmDTO account = accountMapper.selectAdm(adm_id);
		

		if( account == null ) {
			log.debug("## 계정정보가 존재하지 않습니다. ##");
			throw new UsernameNotFoundException(adm_id);
		}
		
		account.setAuthorities(getAuthorities(adm_id));
		
		log.info(account.toString());
		log.info("로그인 이름:::"+account.getUsername());
		log.info("로그인 비번:::"+account.getAdm_pw());
		log.info("로그인 아이디:::"+account.getAdm_id());
		log.info("getAuthorities::::"+adm_id);
		
		return account;
	}
	
	
	
	
	
	@Override
	public Collection<GrantedAuthority> getAuthorities(String adm_id) { 
		List<String> string_authorities = accountMapper.getAdmAuthorites(adm_id);
		  
		if( string_authorities == null ) { 
			throw new UsernameNotFoundException(adm_id); 
		}
		  
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		  
		for (String authority : string_authorities) { 
			authorities.add(new SimpleGrantedAuthority(authority)); 
		}

		return authorities; 
	}	
}
