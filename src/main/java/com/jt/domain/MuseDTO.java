package com.jt.domain;

import org.springframework.security.core.SpringSecurityCoreVersion;

public class MuseDTO {
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private int seq;
	private String lang;  /* KR/EN/CN */
	private String regdate;
	private String museYear;
	private String isntYn;
	private String nameKr;
	private String nameEn;
	private String nameCn;
	private String cateKr;
	private String cateEn;
	private String cateCn;
	private int imgKrSeqs; //다중파일
	private int imgEnSeqs;
	private int imgCnSeqs;
	private String linkKr;
	private String linkKrOutYn;
	private String linkEn;
	private String linkEnOutYn;
	private String linkCn;
	private String linkCnOutYn;
	private String admId;
	private String textLocation;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getmuseYear() {
		return museYear;
	}
	public void setmuseYear(String museYear) {
		this.museYear = museYear;
	}
	public String getIsntYn() {
		return isntYn;
	}
	public void setIsntYn(String isntYn) {
		this.isntYn = isntYn;
	}
	public String getNameKr() {
		return nameKr;
	}
	public void setNameKr(String nameKr) {
		this.nameKr = nameKr;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public String getNameCn() {
		return nameCn;
	}
	public void setNameCn(String nameCn) {
		this.nameCn = nameCn;
	}
	public String getCateKr() {
		return cateKr;
	}
	public void setCateKr(String cateKr) {
		this.cateKr = cateKr;
	}
	public String getCateEn() {
		return cateEn;
	}
	public void setCateEn(String cateEn) {
		this.cateEn = cateEn;
	}
	public String getCateCn() {
		return cateCn;
	}
	public void setCateCn(String cateCn) {
		this.cateCn = cateCn;
	}
	public int getImgKrSeqs() {
		return imgKrSeqs;
	}
	public void setImgKrSeqs(int imgKrSeqs) {
		this.imgKrSeqs = imgKrSeqs;
	}
	public int getImgEnSeqs() {
		return imgEnSeqs;
	}
	public void setImgEnSeqs(int imgEnSeqs) {
		this.imgEnSeqs = imgEnSeqs;
	}
	public int getImgCnSeqs() {
		return imgCnSeqs;
	}
	public void setImgCnSeqs(int imgCnSeqs) {
		this.imgCnSeqs = imgCnSeqs;
	}
	public String getLinkKr() {
		return linkKr;
	}
	public void setLinkKr(String linkKr) {
		this.linkKr = linkKr;
	}
	public String getLinkKrOutYn() {
		return linkKrOutYn;
	}
	public void setLinkKrOutYn(String linkKrOutYn) {
		this.linkKrOutYn = linkKrOutYn;
	}
	public String getLinkEn() {
		return linkEn;
	}
	public void setLinkEn(String linkEn) {
		this.linkEn = linkEn;
	}
	public String getLinkEnOutYn() {
		return linkEnOutYn;
	}
	public void setLinkEnOutYn(String linkEnOutYn) {
		this.linkEnOutYn = linkEnOutYn;
	}
	public String getLinkCn() {
		return linkCn;
	}
	public void setLinkCn(String linkCn) {
		this.linkCn = linkCn;
	}
	public String getLinkCnOutYn() {
		return linkCnOutYn;
	}
	public void setLinkCnOutYn(String linkCnOutYn) {
		this.linkCnOutYn = linkCnOutYn;
	}
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getTextLocation() {
		return textLocation;
	}
	public void setTextLocation(String textLocation) {
		this.textLocation = textLocation;
	}
	
		

}
