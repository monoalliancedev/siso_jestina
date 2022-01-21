package com.jt.domain;

import org.apache.commons.text.StringEscapeUtils;

import com.jt.util.ComUtils;

public class FrontBoardJtDTO {
	//현재값
	private int seq; //일련번호
	private String regdate; //등록일
	private String title; //제목
	//이전값
	private int preSeq; //일련번호
	private String preRegdate; //등록일
	private String preTitle; //제목
	//다음값
	private int nextSeq; //일련번호
	private String nextRegdate; //등록일
	private String nextTitle; //제목

	//상세정보
	private String contents; //내용KR(텍스트에디터)
	private int fileCount; //첨부파일 갯수
	private long fileTotSize; //첨부파일 사이즈
	private int imgSeq; //썸네일 이미지(공지사항,뉴스)
	private String imgUrl; //썸네일 이미지 URL
	private int file1Seq; //첨부파일1
	private int file2Seq; //첨부파일2
	private int file3Seq; //첨부파일3
	private int file4Seq; //첨부파일4
	
	private String[] fileViewName; //첨부파일명
	private String[] fileViewUrl;  //첨부파일경로
	private String[] fileViewSize; //첨부파일사이즈
	private Integer[] fileViewSeq; //첨부파일Seq
	
	
	
	public int getPreSeq() {
		return preSeq;
	}
	public void setPreSeq(int preSeq) {
		this.preSeq = preSeq;
	}
	public String getPreRegdate() {
		return preRegdate;
	}
	public void setPreRegdate(String preRegdate) {
		this.preRegdate = preRegdate;
	}
	public String getPreTitle() {
		return preTitle;
	}
	public void setPreTitle(String preTitle) {
		this.preTitle = preTitle;
	}
	public int getNextSeq() {
		return nextSeq;
	}
	public void setNextSeq(int nextSeq) {
		this.nextSeq = nextSeq;
	}
	public String getNextRegdate() {
		return nextRegdate;
	}
	public void setNextRegdate(String nextRegdate) {
		this.nextRegdate = nextRegdate;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	public long getFileTotSize() {
		return fileTotSize;
	}
	public void setFileTotSize(long fileTotSize) {
		this.fileTotSize = fileTotSize;
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
	public int getFileCount() {
		return fileCount;
	}
	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}
	public String[] getFileViewUrl() {
		return fileViewUrl;
	}
	public void setFileViewUrl(String[] fileViewUrl) {
		this.fileViewUrl = fileViewUrl;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	
}
