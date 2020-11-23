package com.study.springboot.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class VisitDto {
	
	private String category;
	private String id;
	private String password;
	private String content;
	private String group;
	private String step;
	private String no;
	private Timestamp reg;
	
}
