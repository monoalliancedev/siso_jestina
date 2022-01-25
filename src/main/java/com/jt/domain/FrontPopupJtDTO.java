package com.jt.domain;

import org.springframework.security.core.SpringSecurityCoreVersion;

public class FrontPopupJtDTO {
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private String title;
	private String linkUrl;
	private String linkOutYn;
	private String imgUrl;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
