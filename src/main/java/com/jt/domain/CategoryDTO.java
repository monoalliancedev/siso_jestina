package com.jt.domain;

public class CategoryDTO {
	
	private int seq;
	private String admId;
	private String cateName;
	private String regdate;
	private String viewYn;
	private String sortIdx; 
	
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getViewYn() {
		return viewYn;
	}
	public void setViewYn(String viewYn) {
		this.viewYn = viewYn;
	}
	
	public String getSortIdx() {
		return sortIdx;
	}
	public void setSortIdx(String sortIdx) {
		this.sortIdx = sortIdx;
	}
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	@Override
	public String toString() {
		return "CategoryDTO [seq=" + seq + ", cateName=" + cateName + ", regdate=" + regdate + ", viewYn=" + viewYn
				+ ", sortIdx=" + sortIdx + ", admId=" + admId + "]";
	}
	
	
	
	

}
