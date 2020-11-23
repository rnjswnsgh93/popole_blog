package com.study.springboot.dto;

import java.sql.Timestamp;
import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Data;
@Component
@Data
public class MemberDto {
	private String id;
	private String password;
	private String name;
	private Date birth;
	private String mail;
	private Timestamp reg;
	

}
