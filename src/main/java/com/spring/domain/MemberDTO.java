package com.spring.domain;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class MemberDTO {
	private long membern;
	private String id;
	private String password;
	private String name;
	private String gender;
	private String nickname;
	private Date birth;
	private String phone;
	private long permission;
}
