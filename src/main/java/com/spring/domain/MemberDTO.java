package com.spring.domain;

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
	private String sex;
	private String nickname;
	private String birth;
	private String phone;
	private long permission;
}
