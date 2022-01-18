package com.jt.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;

public class AdmDTO implements UserDetails{
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private String adm_id;
	private String adm_pw;
	private String adm_name;
	private String hp;
	private String email;
	private String regdate;
	private String department;
	
	private boolean isAccountNonexpired;
	private boolean isAccountNonLocked;
	private boolean isCredentialsNonExpired;
	private boolean isEnabled;
	private Collection <? extends GrantedAuthority> authorities;

	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.authorities;
	}

	// UserDetails의 필수 메서드들
	@Override
	public String getPassword() {
		return this.adm_pw;
	}

	@Override
	public String getUsername() {
		return this.adm_id;
	}

	@Override
	public boolean isAccountNonExpired() {
		return this.isAccountNonexpired;
	}

	@Override
	public boolean isAccountNonLocked() {
		return this.isAccountNonLocked;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return this.isCredentialsNonExpired;
	}

	@Override
	public boolean isEnabled() {
		return this.isEnabled;
	}

	public String getAdm_id() {
		return adm_id;
	}

	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}

	public String getAdm_pw() {
		return adm_pw;
	}

	public void setAdm_pw(String adm_pw) {
		this.adm_pw = adm_pw;
	}

	public String getAdm_name() {
		return adm_name;
	}

	public void setAdm_name(String adm_name) {
		this.adm_name = adm_name;
	}
		

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public boolean isAccountNonexpired() {
		return isAccountNonexpired;
	}

	public void setAccountNonexpired(boolean isAccountNonexpired) {
		this.isAccountNonexpired = isAccountNonexpired;
	}

	public void setAccountNonLocked(boolean isAccountNonLocked) {
		this.isAccountNonLocked = isAccountNonLocked;
	}

	public void setCredentialsNonExpired(boolean isCredentialsNonExpired) {
		this.isCredentialsNonExpired = isCredentialsNonExpired;
	}

	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	@Override
	public String toString() {
		return "AdmDTO [adm_id=" + adm_id + ", adm_pw=" + adm_pw + ", adm_name=" + adm_name + ", isAccountNonexpired="
				+ isAccountNonexpired + ", isAccountNonLocked=" + isAccountNonLocked + ", isCredentialsNonExpired="
				+ isCredentialsNonExpired + ", isEnabled=" + isEnabled + ", authorities=" + authorities
				+ ", getAuthorities()=" + getAuthorities() + ", getPassword()=" + getPassword() + ", getUsername()="
				+ getUsername() + ", isAccountNonExpired()=" + isAccountNonExpired() + ", isAccountNonLocked()="
				+ isAccountNonLocked() + ", isCredentialsNonExpired()=" + isCredentialsNonExpired() + ", isEnabled()="
				+ isEnabled() + ", isAccountNonexpired()=" + isAccountNonexpired() + "]";
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	
	
	
	

}
