package com.jt.domain;

import java.util.Arrays;
import java.util.List;

import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.web.multipart.MultipartFile;

public class BannerDTO {
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private int seq;
	private String title;
	private String contents;
	private String gubun; /*메인배너,브랜드메인배너 */
	private String lang;  /* KR/EN/CN */
	private String linkKr;
	private String linkKrOutYn;
	private String linkEn;
	private String linkEnOutYn;
	private String linkCn;
	private String linkCnOutYn;
	private int imgKrSeq;
	private int imgEnSeq;
	private int imgCnSeq;
	private int moimgKrSeq;
	private int moimgEnSeq;
	private int moimgCnSeq;
	private String isntYn;
	private int sortIdx; 
	private String regdate;
	private String admId;
	private String fileKRType;
	private String fileENType;
	private String fileCNType;
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public int getMoimgKrSeq() {
		return moimgKrSeq;
	}
	public void setMoimgKrSeq(int moimgKrSeq) {
		this.moimgKrSeq = moimgKrSeq;
	}
	public int getMoimgEnSeq() {
		return moimgEnSeq;
	}
	public void setMoimgEnSeq(int moimgEnSeq) {
		this.moimgEnSeq = moimgEnSeq;
	}
	public int getMoimgCnSeq() {
		return moimgCnSeq;
	}
	public void setMoimgCnSeq(int moimgCnSeq) {
		this.moimgCnSeq = moimgCnSeq;
	}
	public String getIsntYn() {
		return isntYn;
	}
	public void setIsntYn(String isntYn) {
		this.isntYn = isntYn;
	}
	public int getSortIdx() {
		return sortIdx;
	}
	public void setSortIdx(int sortIdx) {
		this.sortIdx = sortIdx;
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
	
	@Override
	public String toString() {
		return "BannerDTO [seq=" + seq + ", title=" + title + ", contents=" + contents + ", gubun=" + gubun + ", lang="
				+ lang + ", linkKr=" + linkKr + ", linkKrOutYn=" + linkKrOutYn + ", linkEn=" + linkEn + ", linkEnOutYn="
				+ linkEnOutYn + ", linkCn=" + linkCn + ", linkCnOutYn=" + linkCnOutYn + ", imgKrSeq=" + imgKrSeq
				+ ", imgEnSeq=" + imgEnSeq + ", imgCnSeq=" + imgCnSeq + ", moimgKrSeq=" + moimgKrSeq + ", moimgEnSeq="
				+ moimgEnSeq + ", moimgCnSeq=" + moimgCnSeq + ", isntYn=" + isntYn + ", sortIdx=" + sortIdx
				+ ", regdate=" + regdate + ", admId=" + admId + ", uploadFile=" + uploadFile
				+ ", fileViewName=" + Arrays.toString(fileViewName) + ", fileViewSize=" + Arrays.toString(fileViewSize)
				+ ", fileViewSeq=" + Arrays.toString(fileViewSeq) + ", getUploadFile()=" + getUploadFile()
				+ ", getFileViewSize()=" + Arrays.toString(getFileViewSize()) + ", getFileViewSeq()="
				+ Arrays.toString(getFileViewSeq()) + ", getAdmId()=" + getAdmId() + ", getSeq()=" + getSeq()
				+ ", getTitle()=" + getTitle() + ", getContents()=" + getContents() + ", getGubun()=" + getGubun()
				+ ", getLang()=" + getLang() + ", getLinkKr()=" + getLinkKr() + ", getLinkKrOutYn()=" + getLinkKrOutYn()
				+ ", getLinkEn()=" + getLinkEn() + ", getLinkEnOutYn()=" + getLinkEnOutYn() + ", getLinkCn()="
				+ getLinkCn() + ", getLinkCnOutYn()=" + getLinkCnOutYn() + ", getImgKrSeq()=" + getImgKrSeq()
				+ ", getImgEnSeq()=" + getImgEnSeq() + ", getImgCnSeq()=" + getImgCnSeq() + ", getMoimgKrSeq()="
				+ getMoimgKrSeq() + ", getMoimgEnSeq()=" + getMoimgEnSeq() + ", getMoimgCnSeq()=" + getMoimgCnSeq()
				+ ", getIsntYn()=" + getIsntYn() + ", getSortIdx()=" + getSortIdx() + ", getRegdate()=" + getRegdate()
				+ ", getFileViewName()=" + Arrays.toString(getFileViewName()) 
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	public String getFileKRType() {
		return fileKRType;
	}
	public void setFileKRType(String fileKRType) {
		this.fileKRType = fileKRType;
	}
	public String getFileENType() {
		return fileENType;
	}
	public void setFileENType(String fileENType) {
		this.fileENType = fileENType;
	}
	public String getFileCNType() {
		return fileCNType;
	}
	public void setFileCNType(String fileCNType) {
		this.fileCNType = fileCNType;
	}
	
	

}
