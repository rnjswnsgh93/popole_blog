package com.study.springboot.dto;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReplyDto {

	private String id;
	private String content;
	private String group;
	private String step;
	private Timestamp reg;
	private String no;
	private String viewno;

	
}
