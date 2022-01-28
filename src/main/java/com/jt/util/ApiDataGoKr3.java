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

public class ApiDataGoKr3 {

	//신주인수권증권시세 3
	//public static void main(String[] args) throws IOException {
	public ApiDataGoKr3() throws UnsupportedEncodingException, IOException {
		
		StringBuilder urlBuilder = new StringBuilder("https://api.odcloud.kr/api/GetStockSecuritiesInfoService/v1/getPreemptiveRightSecuritiesPriceInfo"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=35JdWHo9DsWJLSUbabA6gXl73VtNR8u60lAyPCJQLf1KnrjHvCzX5yvs0leXxzaXtQ5oHTzG98NWtQ4cRqbxzA%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("basDt","UTF-8") + "=" + URLEncoder.encode("20220126", "UTF-8")); /*1페이지 갯수*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*1페이지 갯수*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*현재페이지*/
        urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*resultType : json,xml */
        	
        URL url = new URL(urlBuilder.toString());
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
        System.out.println("-----------------------------------------------------------------------");
        
        
        JSONObject items = (JSONObject)body.get("items");
        JSONArray itemList = (JSONArray)items.getJSONArray("item");
        
        for(int i=0; i < itemList.length(); i++) { 
			System.out.println("======== 신주인수권증권시세 list : " + i + " ========"); 
			JSONObject  listObject = itemList.getJSONObject(i);
			
			System.out.println("기준일자 <basDt> : " + listObject.getString("basDt")); //
			System.out.println("종목 <srtnCd> : " + listObject.getString("srtnCd")); //
			System.out.println("종목 코드(12자리) <isinCd> : " + listObject.getString("isinCd")); //현선물 통합상품의 
			System.out.println("종목의 명칭 <itmsNm> : " + listObject.getString("itmsNm")); //
			System.out.println("주식의 시장 구분 <mrktCtg> : " + listObject.getString("mrktCtg")); //(KOSPI/KOSDAQ/KONEX 중 1)
			
			System.out.println("정규시장의 매매시간종료시까지 형성되는 최종가격 <clpr> : " + listObject.getInt("clpr")); //정규시장의 매매시간종료시까지 형성되는 최종가격
			System.out.println("전일 대비 등락 <vs> : " + listObject.getInt("vs")); //
			System.out.println("전일 대비 등락에 따른 비율 <fltRt> : " + listObject.get("fltRt")); //
			System.out.println("정규시장의 매매시간개시후 형성되는 최초가격 <mkp> : " + listObject.getInt("mkp")); //
			System.out.println("하루 중 가격의 최고치 <hipr> : " + listObject.getInt("hipr")); //
			System.out.println("하루 중 가격의 최저치 <lopr> : " + listObject.getInt("lopr")); //
			System.out.println("체결수량의 누적 합계 <trqu> : " + listObject.getInt("trqu")); //
			System.out.println("거래건 별 체결가격 * 체결수량의 누적 합계 <trPrc> : " + listObject.get("trPrc")); //
			System.out.println("거래건 별 체결가격 * 체결수량의 누적 합계 <trPrc> : " + listObject.getInt("trPrc")); //
			System.out.println("종가 * 상장증권수 <mrktTotAmt> : " + listObject.get("mrktTotAmt")); //
			System.out.println("신주인수권증권의 상장증권수 <lstgScrtCnt> : " + listObject.get("lstgScrtCnt")); //
			System.out.println("권리를 행사할 때 적용되는 가격 <exertPric> : " + listObject.get("exertPric")); //
			System.out.println("신주인수권증권의 존속기간 시작일 <subtPdSttgDt> : " + listObject.get("subtPdSttgDt")); //
			System.out.println("신주인수권증권의 존속기간 종료일 <subtPdEdDt> : " + listObject.get("subtPdEdDt")); //
			System.out.println("신주인수권증권의 목적주권 종목코드 <purRgtScrtItmsCd> : " + listObject.get("purRgtScrtItmsCd")); //
			System.out.println("신주인수권증권의 목적주권 종목명 <purRgtScrtItmsNm> : " + listObject.get("purRgtScrtItmsNm")); //
			System.out.println("신주인수권증권의 목적주권 종가 <purRgtScrtItmsClpr> : " + listObject.get("purRgtScrtItmsClpr")); //
			System.out.println(); //
			System.out.println(); //
			System.out.println(); //
			System.out.println(); //
		}
        
	}

}
