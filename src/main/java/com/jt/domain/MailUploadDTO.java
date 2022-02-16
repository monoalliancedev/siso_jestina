package com.jt.domain;

import java.util.List;

import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.web.multipart.MultipartFile;

public class MailUploadDTO {
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private String recruit;
	private String recruitKey; //채용에서(R), 인터플에서(I)
	private String name;
	private String hp;
	private String email;
	private String contents;
	private List<MultipartFile> uploadFile;
	private String[] fileViewURL;  //첨부파일URL
	private String[] fileViewName; //첨부파일명
	private String[] fileViewSize; //첨부파일사이즈
	public String getRecruit() {
		return recruit;
	}
	public void setRecruit(String recruit) {
		this.recruit = recruit;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public List<MultipartFile> getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(List<MultipartFile> uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String[] getFileViewURL() {
		return fileViewURL;
	}
	public void setFileViewURL(String[] fileViewURL) {
		this.fileViewURL = fileViewURL;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRecruitKey() {
		return recruitKey;
	}
	public void setRecruitKey(String recruitKey) {
		this.recruitKey = recruitKey;
	}
	
	

}
