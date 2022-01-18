package com.jt.domain;

import org.springframework.security.core.SpringSecurityCoreVersion;

public class FrontMuseDTO {
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private int seq;
	private String museYear;
	private String name;
	private String cate;
	private String linkUrl;
	private String linkOutYn;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getMuseYear() {
		return museYear;
	}
	public void setMuseYear(String museYear) {
		this.museYear = museYear;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public String getLinkOutYn() {
		return linkOutYn;
	}
	public void setLinkOutYn(String linkOutYn) {
		this.linkOutYn = linkOutYn;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
		
		

}
