package com.company.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userid;
	private String userpw;	
	private String userName;
	private String enabled;
	
	private String regDate;
	private String updateDate;
	private List<AuthVO> authList;
	

}
