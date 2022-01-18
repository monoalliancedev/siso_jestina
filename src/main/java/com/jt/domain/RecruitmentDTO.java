package com.jt.domain;

import org.apache.commons.text.StringEscapeUtils;

//채용공고
public class RecruitmentDTO {
	
	private Integer seq;
	private String regdate; //등록날짜
	private String isntYn; //게시여부(Y,N)
	private String jobField; //모집부분
	private String careerIsnt; //채용전체(전체A,신입N,경력Y)
	private String business; //사업부분
	private String recruitFromDate; //모집기간 from
	private String recruitToDate; //모집기간 to
	private String recruitEnd; //모집기간 마감(checked)
	private String managerEmail1; //채용담당자 이메일1
	private String managerEmail2; //채용담당자 이메일2
	private String contents; //내용
	private String admId; //관리자 아이디
	
	
	
	public String getAdmId() {
		return admId;
	}

	public void setAdmId(String admId) {
		this.admId = admId;
	}

	public String getRecruitFromDate() {
		return recruitFromDate;
	}

	public void setRecruitFromDate(String recruitFromDate) {
		this.recruitFromDate = recruitFromDate;
	}

	public String getIsntYn() {
		return isntYn;
	}

	public void setIsntYn(String isntYn) {
		this.isntYn = isntYn;
	}

	public String getJobField() {
		return jobField;
	}

	public void setJobField(String jobField) {
		this.jobField = jobField;
	}

	public String getCareerIsnt() {
		return careerIsnt;
	}

	public void setCareerIsnt(String careerIsnt) {
		this.careerIsnt = careerIsnt;
	}

	public String getRecruitToDate() {
		return recruitToDate;
	}

	public void setRecruitToDate(String recruitToDate) {
		this.recruitToDate = recruitToDate;
	}

	public String getRecruitEnd() {
		return recruitEnd;
	}

	public void setRecruitEnd(String recruitEnd) {
		this.recruitEnd = recruitEnd;
	}

	public String getManagerEmail1() {
		return managerEmail1;
	}

	public void setManagerEmail1(String managerEmail1) {
		this.managerEmail1 = managerEmail1;
	}

	public String getManagerEmail2() {
		return managerEmail2;
	}

	public void setManagerEmail2(String managerEmail2) {
		this.managerEmail2 = managerEmail2;
	}

	public Integer getSeq() {
		return seq;
	}
	
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	
	public String getRegdate() {
		return regdate;
	}
	
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public String getBusiness() {
		return business;
	}
	
	public void setBusiness(String business) {
		this.business = business;
	}
	
	public String getContents() {
		return StringEscapeUtils.unescapeHtml4(contents);
	}
	
	public void setContents(String contents) {
		this.contents = StringEscapeUtils.escapeHtml4(contents);
	}
	
}
