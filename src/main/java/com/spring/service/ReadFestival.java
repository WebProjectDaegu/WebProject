package com.spring.service;

import static org.hamcrest.CoreMatchers.nullValue;

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
	public static List<FestivalDTO> read(int pageNo) throws IOException, ParseException, java.text.ParseException {
		List<FestivalDTO> festivalList = new ArrayList<FestivalDTO>();
		StringBuilder urlBuilder = new StringBuilder("http://api.data.go.kr/openapi/tn_pubr_public_cltur_fstvl_api");
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=Rc4sFom7FuKH%2F5sITRwAbU%2BAwbRiIMz4BWQyYIa1TLwa1Kg2xDImrarUPtbILcJ2yPmyqxaTaS1sRwjgPRXmvw%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(Integer.toString(pageNo), "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("100", "UTF-8"));

		
		
		
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
        
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject) parser.parse(jsonString);
        JSONObject festivalArray0 = (JSONObject) jsonObject.get("body");
        JSONArray festivalArray = (JSONArray) jsonObject.get("items");

        
        for(int i = 0;i<festivalArray.size();i++) {
        	JSONObject a = (JSONObject) festivalArray.get(i);
        	FestivalDTO festivalDTO = new FestivalDTO();
			festivalDTO.setName((String) a.get("fstvlNm"));
        	festivalDTO.setOpar((String) a.get("opar"));//개최장소
        	festivalDTO.setFstvlCo((String) a.get("fstvlCo"));
        	festivalDTO.setPhone((String) a.get("phoneNumber"));
        	festivalDTO.setHomepage((String) a.get("homepageUrl"));
        	festivalDTO.setAuspcInstt((String) a.get("auspcInstt"));//주최지
        	festivalDTO.setLatitude((String) a.get("latitude"));//위도
        	festivalDTO.setHardness((String) a.get("longitude"));//경도
        	festivalDTO.setStartdate((String) a.get("fstvlStartDate"));
        	festivalDTO.setEnddate((String) a.get("fstvlEndDate"));
        	festivalDTO.setRdnmadr((String) a.get("rdnmadr"));//도로명주소
        	festivalDTO.setLnmadr((String) a.get("lnmadr"));//지번 주소
        	festivalDTO.setLocation("기타");
        	String w =(String) a.get("rdnmadr");
        	String e =(String) a.get("lnmadr");
        	String[] location = {"세종","대구","부산","광주","서울","인천","대전","울산","경기도","강원도","충청북도","충청남도","경상북도","경상남도","전라북도","전라남도","제주특별자치도"};
        	for(int j =0;j<location.length;j++) {
        		if(e.contains(location[j])||w.contains(location[j])) {
        			festivalDTO.setLocation(location[j]);//지역분류
        			break;
        		}
        	}
        	
        	festivalList.add(festivalDTO);
        	
      	
        }
        
        
        
        return festivalList;
	}
}
