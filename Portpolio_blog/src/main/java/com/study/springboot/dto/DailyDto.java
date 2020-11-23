package com.study.springboot.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;
@Component
@Data
public class DailyDto {
	private String id;
	private String category;
	private String title;
	private String hit;
	private String content;
	private String no;
	private String filename;
	private Timestamp reg;
	private String name;
	
	
}
