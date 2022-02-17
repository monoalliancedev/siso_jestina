package com.jt.domain;

import java.util.List;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.web.multipart.MultipartFile;

public class BrandBannerDTO {
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private int seq;
	private String contents;
	private String gubun; /* "Jewerly","Bag","Romason" */
	private String lang;  /* KR/EN/CN */
	private String linkKr;
	private String molinkKr;
	private String linkKrOutYn;
	private int imgKrSeq;
	private int moimgKrSeq;
	private String admId;
	private List<MultipartFile> uploadFile;
	 
	private String[] fileViewName; //첨부파일명
	private String[] fileViewSize; //첨부파일사이즈
	private Integer[] fileViewSeq; //첨부파일Seq 
	
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String[] getFileViewSize() {
		return fileViewSize;
	}
	public void setFileViewSize(String[] fileViewSize) {
		this.fileViewSize = fileViewSize;
	}
	public Integer[] getFileViewSeq() {
		return fileViewSeq;
	}
	public void setFileViewSeq(Integer[] fileViewSeq) {
		this.fileViewSeq = fileViewSeq;
	}
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getContents() {
		return StringEscapeUtils.unescapeHtml4(contents);
	}
	public void setContents(String contents) {
		this.contents = StringEscapeUtils.escapeHtml4(contents);
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getLinkKr() {
		return linkKr;
	}
	public void setLinkKr(String linkKr) {
		this.linkKr = linkKr;
	}
	public String getMolinkKr() {
		return molinkKr;
	}
	public void setMolinkKr(String molinkKr) {
		this.molinkKr = molinkKr;
	}
	public String getLinkKrOutYn() {
		return linkKrOutYn;
	}
	public void setLinkKrOutYn(String linkKrOutYn) {
		this.linkKrOutYn = linkKrOutYn;
	}
	public int getImgKrSeq() {
		return imgKrSeq;
	}
	public void setImgKrSeq(int imgKrSeq) {
		this.imgKrSeq = imgKrSeq;
	}
	public int getMoimgKrSeq() {
		return moimgKrSeq;
	}
	public void setMoimgKrSeq(int moimgKrSeq) {
		this.moimgKrSeq = moimgKrSeq;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String[] getFileViewName() {
		return fileViewName;
	}
	public void setFileViewName(String[] fileViewName) {
		this.fileViewName = fileViewName;
	}
	
	

}
