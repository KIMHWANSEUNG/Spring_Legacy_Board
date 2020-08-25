package com.legacystudy.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserVO {
	private int idx;
	private String id;
	private String pw;
	private String name;
	private String phone_number;
	private String email;
	private String post_code;
	private String addr1;
	private String addr2;
}
