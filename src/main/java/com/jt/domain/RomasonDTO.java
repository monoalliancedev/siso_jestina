package com.jt.domain;

import java.util.List;

import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.web.multipart.MultipartFile;

public class RomasonDTO {
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private int seq;
	private String regdate;
	private int categorySeq;
	private String viewYn;
	private String isntYn;
	private String proName;
	private String cateName;
	private int proImg1Seq;
	private int proImg2Seq;
	private int proImg3Seq;
	private int proImg4Seq;
	private int proImg5Seq;
	private String proSize;
	private String proMeterial;
	private String proGlass; 
	private String proBand;
	private String proWater;
	private int sortIdx; 
	private String admId;
	private List<MultipartFile> uploadFile;
	private int preSeq;
	private int nextSeq;
	private String[] fileViewName; //첨부파일명
	private String[] fileViewSize; //첨부파일사이즈
	private Integer[] fileViewSeq; //첨부파일Seq 
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getCategorySeq() {
		return categorySeq;
	}
	public void setCategorySeq(int categorySeq) {
		this.categorySeq = categorySeq;
	}
	public String getViewYn() {
		return viewYn;
	}
	public void setViewYn(String viewYn) {
		this.viewYn = viewYn;
	}
	public String getIsntYn() {
		return isntYn;
	}
	public void setIsntYn(String isntYn) {
		this.isntYn = isntYn;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public int getProImg1Seq() {
		return proImg1Seq;
	}
	public void setProImg1Seq(int proImg1Seq) {
		this.proImg1Seq = proImg1Seq;
	}
	public int getProImg2Seq() {
		return proImg2Seq;
	}
	public void setProImg2Seq(int proImg2Seq) {
		this.proImg2Seq = proImg2Seq;
	}
	public int getProImg3Seq() {
		return proImg3Seq;
	}
	public void setProImg3Seq(int proImg3Seq) {
		this.proImg3Seq = proImg3Seq;
	}
	public int getProImg4Seq() {
		return proImg4Seq;
	}
	public void setProImg4Seq(int proImg4Seq) {
		this.proImg4Seq = proImg4Seq;
	}
	public int getProImg5Seq() {
		return proImg5Seq;
	}
	public void setProImg5Seq(int proImg5Seq) {
		this.proImg5Seq = proImg5Seq;
	}
	public String getProSize() {
		return proSize;
	}
	public void setProSize(String proSize) {
		this.proSize = proSize;
	}
	public String getProMeterial() {
		return proMeterial;
	}
	public void setProMeterial(String proMeterial) {
		this.proMeterial = proMeterial;
	}
	public String getProGlass() {
		return proGlass;
	}
	public void setProGlass(String proGlass) {
		this.proGlass = proGlass;
	}
	public String getProBand() {
		return proBand;
	}
	public void setProBand(String proBand) {
		this.proBand = proBand;
	}
	public String getProWater() {
		return proWater;
	}
	public void setProWater(String proWater) {
		this.proWater = proWater;
	}
	public int getSortIdx() {
		return sortIdx;
	}
	public void setSortIdx(int sortIdx) {
		this.sortIdx = sortIdx;
	}
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String[] getFileViewName() {
		return fileViewName;
	}
	public void setFileViewName(String[] fileViewName) {
		this.fileViewName = fileViewName;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public int getPreSeq() {
		return preSeq;
	}
	public void setPreSeq(int preSeq) {
		this.preSeq = preSeq;
	}
	public int getNextSeq() {
		return nextSeq;
	}
	public void setNextSeq(int nextSeq) {
		this.nextSeq = nextSeq;
	}
	
	
	
	

}
