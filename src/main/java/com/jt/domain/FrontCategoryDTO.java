package com.jt.domain;

public class FrontCategoryDTO {
	
	private int seq;
	private String cateName;
	
	private int nextSeq;
	private String nextCateName;
	
	private int preSeq;
	private String preCateName;
	
	
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
	public int getNextSeq() {
		return nextSeq;
	}
	public void setNextSeq(int nextSeq) {
		this.nextSeq = nextSeq;
	}
	public String getNextCateName() {
		return nextCateName;
	}
	public void setNextCateName(String nextCateName) {
		this.nextCateName = nextCateName;
	}
	public int getPreSeq() {
		return preSeq;
	}
	public void setPreSeq(int preSeq) {
		this.preSeq = preSeq;
	}
	public String getPreCateName() {
		return preCateName;
	}
	public void setPreCateName(String preCateName) {
		this.preCateName = preCateName;
	}
	
	
	
	

}
