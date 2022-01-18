package com.jt.domain;

import org.apache.commons.text.StringEscapeUtils;

import com.jt.util.ComUtils;

public class FrontBoardJtDTO {
	
	private int seq; //일련번호
	private String regdate; //등록일
	private String title; //제목
	private String contents; //내용KR(텍스트에디터)
	private int imgSeq; //썸네일 이미지(공지사항,뉴스)
	private int file1Seq; //첨부파일1
	private int file2Seq; //첨부파일2
	private int file3Seq; //첨부파일3
	private int file4Seq; //첨부파일4
	private String imgUrl; //썸네일 이미지(공지사항,뉴스) Url
	private String file1Url; //첨부파일1 Url
	private String file2Url; //첨부파일2 Url
	private String file3Url; //첨부파일3 Url
	private String file4Url; //첨부파일4 Url
	
	/*
	private String admId; //관리자아이디
	private String isntYn; //게시여부
	private String lang; //KR,EN,CN
	private String gubun; //notice(공고),alim(공지사항),news(뉴스) 
	private String mainYn; //메인노출여부 Y,N(뉴스만)
	*/
	
	
	
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
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getFile1Url() {
		return file1Url;
	}
	public void setFile1Url(String file1Url) {
		this.file1Url = file1Url;
	}
	public String getFile2Url() {
		return file2Url;
	}
	public void setFile2Url(String file2Url) {
		this.file2Url = file2Url;
	}
	public String getFile3Url() {
		return file3Url;
	}
	public void setFile3Url(String file3Url) {
		this.file3Url = file3Url;
	}
	public String getFile4Url() {
		return file4Url;
	}
	public void setFile4Url(String file4Url) {
		this.file4Url = file4Url;
	}
	public String getContents() {
		return StringEscapeUtils.unescapeHtml4(contents);
	}
	public void setContents(String contents) {
		this.contents = StringEscapeUtils.escapeHtml4(contents);
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
	public String getContentsMain() throws Exception {
		return ComUtils.rmTag(this.getContents());
	}
	
}
