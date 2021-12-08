package com.spring.domain;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;



@Data
public class FestivalDTO {
	private long bno;
	private String name;//축제명
	private String opar;//개최장소
	private String fstvlCo;//축제내용
	private String phone;
	private String homepage;
	private String auspcInstt;//주최지
	private String latitude;//위도
	private String hardness;//경도
	private String rdnmadr;//도로명주소
	private String lnmadr;//지번 주소
	private String location;//지역분류
	private String startdate;
	private String enddate;
}
