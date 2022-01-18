package com.jt.domain;

import java.util.List;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.web.multipart.MultipartFile;

public class BoardJtDTO {
	
	private int seq; //일련번호
	private String gubun; //notice(공고),alim(공지사항),news(뉴스) 
	private String mainYn; //메인노출여부 Y,N(뉴스만)
	private int imgSeq; //썸네일 이미지(공지사항,뉴스)
	private int file1Seq; //첨부파일1
	private int file2Seq; //첨부파일2
	private int file3Seq; //첨부파일3
	private int file4Seq; //첨부파일4
	private String lang; //KR,EN,CN
	private String regdate; //등록일
	private String isntYn; //게시여부
	private String titleKr; //제목KR
	private String titleEn; //제목EN
	private String titleCn; //제목CN
	private String contentsKr; //내용KR(텍스트에디터)
	private String contentsEn; //내용EN(텍스트에디터)
	private String contentsCn; //내용CN(텍스트에디터)
	private String admId; //관리자아이디
	private List<MultipartFile> uploadFile;
	
	private String[] fileViewName; //첨부파일명
	private String[] fileViewSize; //첨부파일사이즈
	private Integer[] fileViewSeq; //첨부파일Seq
	
	
	
	public Integer[] getFileViewSeq() {
		return fileViewSeq;
	}


	public void setFileViewSeq(Integer[] fileViewSeq) {
		this.fileViewSeq = fileViewSeq;
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


	@Override
	public String toString() {
		return "BoardJtDTO [seq=" + seq + ", gubun=" + gubun + ", mainYn=" + mainYn + ", imgSeq=" + imgSeq
				+ ", file1Seq=" + file1Seq + ", file2Seq=" + file2Seq + ", file3Seq=" + file3Seq + ", file4Seq="
				+ file4Seq + ", lang=" + lang + ", regdate=" + regdate + ", isntYn=" + isntYn + ", titleKr=" + titleKr
				+ ", titleEn=" + titleEn + ", titleCn=" + titleCn + ", contentsKr=" + contentsKr + ", contentsEn="
				+ contentsEn + ", contentsCn=" + contentsCn + ", admId=" + admId + ", uploadFile=" + uploadFile + "]";
	}
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getMainYn() {
		return mainYn;
	}
	public void setMainYn(String mainYn) {
		this.mainYn = mainYn;
	}
	public int getImgSeq() {
		return imgSeq;
	}
	public void setImgSeq(int imgSeq) {
		this.imgSeq = imgSeq;
	}
	public int getFile1Seq() {
		return file1Seq;
	}
	public void setFile1Seq(int file1Seq) {
		this.file1Seq = file1Seq;
	}
	public int getFile2Seq() {
		return file2Seq;
	}
	public void setFile2Seq(int file2Seq) {
		this.file2Seq = file2Seq;
	}
	public int getFile3Seq() {
		return file3Seq;
	}
	public void setFile3Seq(int file3Seq) {
		this.file3Seq = file3Seq;
	}
	public int getFile4Seq() {
		return file4Seq;
	}
	public void setFile4Seq(int file4Seq) {
		this.file4Seq = file4Seq;
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
	public String getIsntYn() {
		return isntYn;
	}
	public void setIsntYn(String isntYn) {
		this.isntYn = isntYn;
	}
	public String getTitleKr() {
		return titleKr;
	}
	public void setTitleKr(String titleKr) {
		this.titleKr = titleKr;
	}
	public String getTitleEn() {
		return titleEn;
	}
	public void setTitleEn(String titleEn) {
		this.titleEn = titleEn;
	}
	public String getTitleCn() {
		return titleCn;
	}
	public void setTitleCn(String titleCn) {
		this.titleCn = titleCn;
	}
	public String getContentsKr() {
		return StringEscapeUtils.unescapeHtml4(contentsKr);
	}
	public void setContentsKr(String contentsKr) {
		this.contentsKr = StringEscapeUtils.escapeHtml4(contentsKr);
	}
	public String getContentsEn() {
		return StringEscapeUtils.unescapeHtml4(contentsEn);
	}
	public void setContentsEn(String contentsEn) {
		this.contentsEn = StringEscapeUtils.escapeHtml4(contentsEn);
	}
	public String getContentsCn() {
		return StringEscapeUtils.unescapeHtml4(contentsCn);
	}
	public void setContentsCn(String contentsCn) {
		this.contentsCn = StringEscapeUtils.escapeHtml4(contentsCn);
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
			  
	
	

}
