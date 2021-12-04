package com.spring.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Data
public class FestivalDTO {
	private String name;
	private String location;
	private String content;
	private String phone;
	private String homepage;
	private String local;
	private String latitude;
	private String hardness;
	private String startdate;
	private String enddate;
}
