package com.jt.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONArray;
import org.json.JSONObject;

import com.jt.domain.ApiDataGoKrDTO;

public class ApiDataGoKr {

	//주가정보
	public ApiDataGoKrDTO ApiProc(String strNowDate) throws UnsupportedEncodingException, IOException {
			
		///getStockPriceInfo (주식시세)
		StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/GetStockSecuritiesInfoService/v1/getStockPriceInfo"); /*URL*/
		
		urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=35JdWHo9DsWJLSUbabA6gXl73VtNR8u60lAyPCJQLf1KnrjHvCzX5yvs0leXxzaXtQ5oHTzG98NWtQ4cRqbxzA%3D%3D"); /*Service Key*/
		urlBuilder.append("&" + URLEncoder.encode("basDt","UTF-8") + "=" + URLEncoder.encode(strNowDate, "UTF-8")); /**/
		urlBuilder.append("&" + URLEncoder.encode("itmsNm","UTF-8") + "=" + URLEncoder.encode("제이에스티나", "UTF-8")); /*1페이지 갯수*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*1페이지 갯수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재페이지*/
        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*resultType : json,xml */
        
        URL url = new URL(urlBuilder.toString());
        
        System.out.println("URL : " + url);
        
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
        //System.out.println(sb.toString());
        //System.out.println("-----------------------------------------------------------------------");

        JSONObject jsonObj = new JSONObject(sb.toString());
        //System.out.println(jsonObj.get("response")); 
        //System.out.println("-----------------------------------------------------------------------");

        JSONObject response = (JSONObject)jsonObj.get("response"); //200:정상호출,422:INVALID REQUEST PARAMETER ERROR.,500:DB_ERROR.
        JSONObject header = (JSONObject)response.get("header");
        JSONObject body = (JSONObject)response.get("body");
        
        System.out.println("resultCode  : " + header.get("resultCode")); 
        System.out.println("resultMsg  : " + header.get("resultMsg"));
        System.out.println("pageNo  : " + body.get("pageNo")); 
        System.out.println("totalCount  : " + body.get("totalCount"));
        System.out.println("numOfRows  : " + body.get("numOfRows"));
        //System.out.println("-----------------------------------------------------------------------");
        
        
        JSONObject items = (JSONObject)body.get("items");
        JSONArray itemList = (JSONArray)items.getJSONArray("item");
        
        System.out.println("######## itemList.length()  : " + itemList.length());
        
        ApiDataGoKrDTO dto = new ApiDataGoKrDTO();
        
        for(int i=0; i < itemList.length(); i++) { 
			
        	System.out.println("======== 주가정보 list : " + i + " ========"); 
        	
        	JSONObject listObject = itemList.getJSONObject(i);
        	
        	System.out.println("######## basDt  : " + listObject.getString("basDt"));
			System.out.println("######## clpr  : " + listObject.getInt("clpr"));
			System.out.println("######## vs  : " + listObject.getInt("vs"));
			
			
        	dto.setBasDt(listObject.getString("basDt")); //기준일자 
			dto.setClpr(String.valueOf(listObject.getInt("clpr"))); //제이에스티나 현재가
			dto.setVs(String.valueOf(listObject.getInt("vs"))); //전일대비
			dto.setFltRt(String.valueOf(listObject.get("fltRt"))); //전일대비
			dto.setTrqu(String.valueOf(listObject.getInt("trqu"))); //거래량
			dto.setTrPrc(String.valueOf(listObject.get("trPrc"))); //거래대금
			dto.setMkp(String.valueOf(listObject.getInt("mkp"))); //시가
			dto.setHipr(String.valueOf(listObject.getInt("hipr"))); //고가
			dto.setLstgStCnt(String.valueOf(listObject.getInt("lstgStCnt"))); //상장주식수
			dto.setLopr(String.valueOf(listObject.getInt("lopr"))); //저가
			System.out.println("=========================================");
		}
        
        //System.out.println(dtoList.size());
        return  dto;
        
	}

}
