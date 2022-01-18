package com.jt.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class SearchDTO extends Page2DTO{

	private String key;
	private String keyword;
	private String keyIsnt;
	private String keyGubun;
	
	private String keyValue1;
	private String keyValue2;
	private String keyValue3;
	
	public SearchDTO() {
		this.key = "";
		this.keyword = "";
		this.keyIsnt = "";
		this.keyGubun = "";
	}
	
	public String getKeyValue1() {
		return keyValue1;
	}
	
	public void setKeyValue1(String keyValue1) {
		this.keyValue1 = keyValue1;
	}
	
	public String getKeyValue2() {
		return keyValue2;
	}
	
	public void setKeyValue2(String keyValue2) {
		this.keyValue2 = keyValue2;
	}
	
	public String getKeyValue3() {
		return keyValue3;
	}
	
	public void setKeyValue3(String keyValue3) {
		this.keyValue3 = keyValue3;
	}

	public String getKeyGubun() {
		return keyGubun;
	}
	
	public void setKeyGubun(String keyGubun) {
		this.keyGubun = keyGubun;
	}

	public String getKeyIsnt() {
		return keyIsnt;
	}

	public void setKeyIsnt(String keyIsnt) {
		this.keyIsnt = keyIsnt;
	}
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	//	URI 파라미터를 쉽게 만들어주는 유틸메서드 선언.
	public String makeURI(Integer page) {

		UriComponents ucp = UriComponentsBuilder.newInstance()
				.queryParam("cpage",page)
				.queryParam("keyIsnt", this.keyIsnt)
				.queryParam("key", this.key)
				.queryParam("keyword", this.keyword)
				.build();
			
		return ucp.toUriString();
	}
}




	
	

