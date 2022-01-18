package com.jt.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

public interface AdmLoginService extends UserDetailsService{
	
	public Collection<GrantedAuthority> getAuthorities(String adm_id);
	public PasswordEncoder passwordEncoder();
}
