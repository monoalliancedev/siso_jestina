package com.jt.domain;

public class AdmAuthorityDTO {
	
	private String adm_id;
	private String authority_name;
	
	public String getAdm_id() {
		return adm_id;
	}

	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}

	public String getAuthority_name() {
		return authority_name;
	}

	public void setAuthority_name(String authority_name) {
		this.authority_name = authority_name;
	}

	@Override
	public String toString() {
		return "Authority [userName=" + adm_id + ", authorityName=" + authority_name + "]";
	}	

}
