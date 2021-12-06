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
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("6", "UTF-8"));
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
        	
      	
        }
        
        
        
        return festivalList;
	}
}
