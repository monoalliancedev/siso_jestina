package com.jt.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import com.jt.domain.ApiOpendartDTO;

public class ApiOpendart {

	//공시정보
	public List<ApiOpendartDTO> ApiProc(String bgnDe,String endDe, int pageNo, int pageCount) throws UnsupportedEncodingException, IOException {
			
		if(pageNo==0) pageNo=1;
        
		StringBuilder urlBuilder = new StringBuilder("https://opendart.fss.or.kr/api/list.json"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("crtfc_key","UTF-8") + "=0261d39627725ac124a2a482980fb00e9f8f5eee"); /*API 인증키*/
        urlBuilder.append("&corp_code=00120289"); /*고유번호*/
        urlBuilder.append("&bgn_de="+bgnDe); //시작일
        urlBuilder.append("&end_de="+endDe); //종료일
        urlBuilder.append("&page_no="+pageNo); //페이지번호
        urlBuilder.append("&page_count="+pageCount); //페이지별 건수
        
        URL url = new URL(urlBuilder.toString());
        System.out.println(url);
      
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        
        System.out.println("Response code: " + conn.getResponseCode());
        
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
		JSONObject jsonObj = new JSONObject(sb.toString()); //sb String
		
		JSONArray listArr = jsonObj.getJSONArray("list");
		
		List<ApiOpendartDTO> dtoList = new ArrayList<ApiOpendartDTO>();
		
		for(int i=0; i < listArr.length(); i++) { 
			
			JSONObject listObject = listArr.getJSONObject(i);
			
			ApiOpendartDTO dto = new ApiOpendartDTO();
			dto.setCorp_cls(listObject.getString("corp_cls")); //법인구분 Y(유가), K(코스닥), N(코넥스), E(기타)
			dto.setCorp_code(listObject.getString("corp_code")); //공시대상회사의 고유번호(8자리)
			dto.setStock_code(listObject.getString("stock_code")); //상장회사의 종목코드(6자리) 
			dto.setRcept_no(listObject.getString("rcept_no")); //접수번호(14자리)
			dto.setReport_nm(listObject.getString("report_nm")); //보고서명 
			dto.setCorp_name(listObject.getString("corp_name")); //종목명(법인명)
			dto.setFlr_nm(listObject.getString("flr_nm")); //공시 제출인명
			dto.setRcept_dt(listObject.getString("rcept_dt")); //공시 접수일자(YYYYMMDD)
			dto.setRm(listObject.getString("rm")); //비고
			
			dtoList.add(i,dto);
		}
		
		System.out.println(dtoList.size());
        return  dtoList;
        
	}

}
