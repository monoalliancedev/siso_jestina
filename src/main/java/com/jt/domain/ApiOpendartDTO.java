package com.jt.domain;

import org.springframework.security.core.SpringSecurityCoreVersion;
//주식정보
public class ApiOpendartDTO {
	
	//private static final long serialVersionUID = 1L;
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private String corp_cls; //법인구분 Y(유가), K(코스닥), N(코넥스), E(기타)
	private String corp_code;  //공시대상회사의 고유번호(8자리)
	private String stock_code; ////상장회사의 종목코드(6자리) 
	private String rcept_no; //접수번호(14자리)
	private String report_nm; //보고서명 
	private String corp_name; //종목명(법인명)
	private String flr_nm; //공시 제출인명
	private String rcept_dt; //공시 접수일자(YYYYMMDD)
	private String rm; //비고
	
	
	public String getCorp_cls() {
		return corp_cls;
	}
	public void setCorp_cls(String corp_cls) {
		this.corp_cls = corp_cls;
	}
	public String getCorp_code() {
		return corp_code;
	}
	public void setCorp_code(String corp_code) {
		this.corp_code = corp_code;
	}
	public String getStock_code() {
		return stock_code;
	}
	public void setStock_code(String stock_code) {
		this.stock_code = stock_code;
	}
	public String getRcept_no() {
		return rcept_no;
	}
	public void setRcept_no(String rcept_no) {
		this.rcept_no = rcept_no;
	}
	public String getReport_nm() {
		return report_nm;
	}
	public void setReport_nm(String report_nm) {
		this.report_nm = report_nm;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getFlr_nm() {
		return flr_nm;
	}
	public void setFlr_nm(String flr_nm) {
		this.flr_nm = flr_nm;
	}
	public String getRcept_dt() {
		return rcept_dt;
	}
	public void setRcept_dt(String rcept_dt) {
		this.rcept_dt = rcept_dt;
	}
	public String getRm() {
		return rm;
	}
	public void setRm(String rm) {
		this.rm = rm;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
}
