package com.jt.domain;

import org.springframework.security.core.SpringSecurityCoreVersion;

public class StoreDTO {
	
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private int seq;		//일련번호
	private String lang;	//KR/EN/CN	
	private String tel;		//전화번호
	private String regdate;	//
	private String addr1Kr;//주소1 KR	
	private String addr2Kr;//주소2 KR
	private String addr1En;//주소1 EN
	private String addr2En;//주소2 EN
	private String addr1Cn;//주소1 CN
	private String addr2Cn;//주소2 CN
	private String storeKr;//매장명KR
	private String storeEn;//매장명EN
	private String storeCn;//매장명CN
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
	public String getAddr1Kr() {
		return addr1Kr;
	}
	public void setAddr1Kr(String addr1Kr) {
		this.addr1Kr = addr1Kr;
	}
	public String getAddr2Kr() {
		return addr2Kr;
	}
	public void setAddr2Kr(String addr2Kr) {
		this.addr2Kr = addr2Kr;
	}
	public String getAddr1En() {
		return addr1En;
	}
	public void setAddr1En(String addr1En) {
		this.addr1En = addr1En;
	}
	public String getAddr2En() {
		return addr2En;
	}
	public void setAddr2En(String addr2En) {
		this.addr2En = addr2En;
	}
	public String getAddr1Cn() {
		return addr1Cn;
	}
	public void setAddr1Cn(String addr1Cn) {
		this.addr1Cn = addr1Cn;
	}
	public String getAddr2Cn() {
		return addr2Cn;
	}
	public void setAddr2Cn(String addr2Cn) {
		this.addr2Cn = addr2Cn;
	}
	public String getStoreKr() {
		return storeKr;
	}
	public void setStoreKr(String storeKr) {
		this.storeKr = storeKr;
	}
	public String getStoreEn() {
		return storeEn;
	}
	public void setStoreEn(String storeEn) {
		this.storeEn = storeEn;
	}
	public String getStoreCn() {
		return storeCn;
	}
	public void setStoreCn(String storeCn) {
		this.storeCn = storeCn;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "StoreDTO [seq=" + seq + ", lang=" + lang + ", tel=" + tel + ", regdate=" + regdate + ", addr1Kr="
				+ addr1Kr + ", addr2Kr=" + addr2Kr + ", addr1En=" + addr1En + ", addr2En=" + addr2En + ", addr1Cn="
				+ addr1Cn + ", addr2Cn=" + addr2Cn + ", storeKr=" + storeKr + ", storeEn=" + storeEn + ", storeCn="
				+ storeCn + ", gubun=" + gubun + ", value1=" + value1 + ", value2=" + value2 + ", value3=" + value3
				+ ", admId=" + admId + "]";
	}
	public String getSortIdx() {
		return sortIdx;
	}
	public void setSortIdx(String sortIdx) {
		this.sortIdx = sortIdx;
	}
}
