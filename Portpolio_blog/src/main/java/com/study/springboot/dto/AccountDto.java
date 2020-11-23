package com.study.springboot.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class AccountDto {

	private Date contentdate;
	private String account;
	private String content;
	private String category;
	private String id;
	private Timestamp reg;
	private String no;
	private String title;
}
