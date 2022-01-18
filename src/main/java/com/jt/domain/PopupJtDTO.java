package com.jt.domain;

import java.util.List;

import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.web.multipart.MultipartFile;

public class PopupJtDTO {
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private int seq;
	private String title;
	private String lang;  /* KR,EN,CN' */
	private String linkKr;
	private String linkKrOutYn;
	private String linkEn;
	private String linkEnOutYn;
	private String linkCn;
	private String linkCnOutYn;
	private int imgKrSeq;
	private int imgEnSeq;
	private int imgCnSeq;
	private String isntYn;
	private String regdate;
	private String admId;
	private String fromDate;
	private String toDate;
	private String popscrollYn;
	private int winWidth; 
	private int winHeight; 
	private int winLeft; 
	private int winTop; 
	private List<MultipartFile> uploadFile;
	private String[] fileViewName; //첨부파일명
	private String[] fileViewSize; //첨부파일사이즈
	private Integer[] fileViewSeq; //첨부파일Seq 
	
	
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getPopscrollYn() {
		return popscrollYn;
	}
	public void setPopscrollYn(String popscrollYn) {
		this.popscrollYn = popscrollYn;
	}
	public int getWinWidth() {
		return winWidth;
	}
	public void setWinWidth(int winWidth) {
		this.winWidth = winWidth;
	}
	public int getWinHeight() {
		return winHeight;
	}
	public void setWinHeight(int winHeight) {
		this.winHeight = winHeight;
	}
	public int getWinLeft() {
		return winLeft;
	}
	public void setWinLeft(int winLeft) {
		this.winLeft = winLeft;
	}
	public int getWinTop() {
		return winTop;
	}
	public void setWinTop(int winTop) {
		this.winTop = winTop;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getImgKrSeq() {
		return imgKrSeq;
	}
	public void setImgKrSeq(int imgKrSeq) {
		this.imgKrSeq = imgKrSeq;
	}
	public int getImgEnSeq() {
		return imgEnSeq;
	}
	public void setImgEnSeq(int imgEnSeq) {
		this.imgEnSeq = imgEnSeq;
	}
	public int getImgCnSeq() {
		return imgCnSeq;
	}
	public void setImgCnSeq(int imgCnSeq) {
		this.imgCnSeq = imgCnSeq;
	}
	public String getIsntYn() {
		return isntYn;
	}
	public void setIsntYn(String isntYn) {
		this.isntYn = isntYn;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
