package com.jt.domain;


public class AdmJtAuthDTO {
	
	private Integer seq;
	private String adm_id;
	private String menu_code;
	
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getAdm_id() {
		return adm_id;
	}
	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}
	public String getMenu_code() {
		return menu_code;
	}
	public void setMenu_code(String menu_code) {
		this.menu_code = menu_code;
	}
	
	@Override
	public String toString() {
		return "AdmJtAuthDTO [seq=" + seq + ", adm_id=" + adm_id + ", menu_code=" + menu_code + "]";
	}

}
