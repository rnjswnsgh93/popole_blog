package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.ReplyDto;

@Mapper
public interface ReplyDao {

	public void insert(ReplyDto dto);
	public void insert_reply(ReplyDto dto);
	public void delete(String no);
	public ArrayList<ReplyDto> reply_list(String no);
	public int count_reply(String no);
	public ReplyDto getNo(String no);
}
