package com.jt.domain;

import org.springframework.security.core.SpringSecurityCoreVersion;
//주식정보
public class ApiDataGoKrDTO {
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private String clpr; //제이에스티나 현재가
	private String vs;  //전일대비
	private String fltRt; //전일대비
	private String trqu; //거래량
	private String trPrc; //거래대금
	private String mkp; //시가
	private String hipr; //고가
	private String lstgStCnt; //상장주식수
	private String lopr; //저가
	private String basDt; //기준일자
	public String getClpr() {
		return clpr;
	}
	public void setClpr(String clpr) {
		this.clpr = clpr;
	}
	public String getVs() {
		return vs;
	}
	public void setVs(String vs) {
		this.vs = vs;
	}
	public String getFltRt() {
		return fltRt;
	}
	public void setFltRt(String fltRt) {
		this.fltRt = fltRt;
	}
	public String getTrqu() {
		return trqu;
	}
	public void setTrqu(String trqu) {
		this.trqu = trqu;
	}
	public String getTrPrc() {
		return trPrc;
	}
	public void setTrPrc(String trPrc) {
		this.trPrc = trPrc;
	}
	public String getMkp() {
		return mkp;
	}
	public void setMkp(String mkp) {
		this.mkp = mkp;
	}
	public String getHipr() {
		return hipr;
	}
	public void setHipr(String hipr) {
		this.hipr = hipr;
	}
	public String getLstgStCnt() {
		return lstgStCnt;
	}
	public void setLstgStCnt(String lstgStCnt) {
		this.lstgStCnt = lstgStCnt;
	}
	public String getLopr() {
		return lopr;
	}
	public void setLopr(String lopr) {
		this.lopr = lopr;
	}
	public String getBasDt() {
		return basDt;
	}
	public void setBasDt(String basDt) {
		this.basDt = basDt;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	//String srtnCd; //종목
	//String isinCd; //종목 코드(12자리)
	//String itmsNm; //종목의 명칭
	//String mrktCtg; //주식의 시장 구분
	
	
	
}
