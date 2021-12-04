package com.spring.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.spring.domain.FestivalDTO;

public class ReadFestival {
	
	public int a =1;
	public static List<FestivalDTO> read() throws IOException, ParseException {
		List<FestivalDTO> festivalList = new ArrayList<FestivalDTO>();
		StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api");
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=Rc4sFom7FuKH%2F5sITRwAbU%2BAwbRiIMz4BWQyYIa1TLwa1Kg2xDImrarUPtbILcJ2yPmyqxaTaS1sRwjgPRXmvw%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("0", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8"));

		
		
		
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(),"UTF-8"));
		}
		
		StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        String jsonString = sb.substring(sb.lastIndexOf("body")+6);
        jsonString = (String) jsonString.subSequence(0, jsonString.length()-2);
        
        //String jsonInfo = "{\"books\":[{\"genre\":\"소설\",\"price\":\"100\",\"name\":\"사람은 무엇으로 사는가?\",\"writer\":\"톨스토이\",\"publisher\":\"톨스토이 출판사\"},{\"genre\":\"소설\",\"price\":\"300\",\"name\":\"홍길동전\",\"writer\":\"허균\",\"publisher\":\"허균 출판사\"},{\"genre\":\"소설\",\"price\":\"900\",\"name\":\"레미제라블\",\"writer\":\"빅토르 위고\",\"publisher\":\"빅토르 위고 출판사\"}],\"persons\":[{\"nickname\":\"남궁민수\",\"age\":\"25\",\"name\":\"송강호\",\"gender\":\"남자\"},{\"nickname\":\"예니콜\",\"age\":\"21\",\"name\":\"전지현\",\"gender\":\"여자\"}]}";
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject) parser.parse(jsonString);
        JSONObject festivalArray0 = (JSONObject) jsonObject.get("body");
        JSONArray festivalArray = (JSONArray) jsonObject.get("items");

        
        for(int i = 0;i<festivalArray.size();i++) {
        	JSONObject a = (JSONObject) festivalArray.get(i);
        	FestivalDTO festivalDTO = new FestivalDTO();
        	
			festivalDTO.setName((String) a.get("fstvlNm")+"("+(String)a.get("fstvlStartDate")+")");
        	festivalDTO.setLocation((String) a.get("opar"));
        	festivalDTO.setContent((String) a.get("fstvlCo"));
        	festivalDTO.setPhone((String) a.get("phoneNumber"));
        	festivalDTO.setHomepage((String) a.get("homepageUrl"));
        	festivalDTO.setLocal((String) a.get("auspcInstt"));
        	festivalDTO.setLatitude((String) a.get("latitude"));
        	festivalDTO.setHardness((String) a.get("longitude"));
        	festivalDTO.setStartdate((String) a.get("fstvlStartDate"));
        	festivalDTO.setEnddate((String) a.get("fstvlEndDate"));
        	festivalList.add(festivalDTO);
        	
//
//        	System.out.println("======================================================");
//        	System.out.println("축제명 : "+i + "  "+a.get("fstvlNm"));
//        	System.out.println("개최장소 :"+ a.get("opar"));
//        	System.out.println("축제시작일자 :"+a.get("fstvlStartDate"));
//        	System.out.println("축제종료일자 :"+a.get("fstvlEndDate"));
//        	System.out.println("축제내용 :"+a.get("fstvlCo"));
//        	System.out.println("주관기관 :"+a.get("mnnst"));
//        	System.out.println("주최기관 :"+a.get("auspcInstt"));
//        	System.out.println("후원기관 :"+a.get("suprtInstt"));
//        	System.out.println("홈페이지주소 :"+a.get("homepageUrl"));
//        	System.out.println("전화번호 :"+a.get("phoneNumber"));
//        	System.out.println("관련정보 :"+a.get("relateInfo"));
//        	System.out.println("소재지도로명주소 :"+a.get("rdnmadr"));
//        	System.out.println("소재지지번주소 :"+a.get("lnmadr"));
//        	System.out.println("위도 :"+a.get("latitude"));
//        	System.out.println("경도 :"+a.get("hardness"));
//        	System.out.println("데이터기준일자 :"+a.get("referenceDate"));
//        	System.out.println("======================================================");
//        	
        }
        
        
        
        return festivalList;
	}
}
