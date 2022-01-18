package com.jt.domain;

import org.springframework.security.core.SpringSecurityCoreVersion;

public class FrontStoreDTO {
	
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private int seq;		//일련번호
	private String lang;	//KR/EN/CN	
	private String tel;		//전화번호
	private String regdate;	//
	private String addr1;	//주소1	
	private String addr2;	//주소2
	private String store;	//매장명
	private String gubun;	//구분(domestic/overseas)
	private String value1;	//국내(지역 Area),국외(대륙 Continent)
	private String value2;	//국내(브랜드 Brand)국외(국가 Country)
	private String value3;	//국내(매장구분 StoreGubun),국외(이메일 email)
	private String admId;	//관리자
	private String sortIdx;	//정렬
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getValue1() {
		return value1;
	}
	public void setValue1(String value1) {
		this.value1 = value1;
	}
	public String getValue2() {
		return value2;
	}
	public void setValue2(String value2) {
		this.value2 = value2;
	}
	public String getValue3() {
		return value3;
	}
	public void setValue3(String value3) {
		this.value3 = value3;
	}
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	public String getSortIdx() {
		return sortIdx;
	}
	public void setSortIdx(String sortIdx) {
		this.sortIdx = sortIdx;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
