package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.VisitDto;

@Mapper
public interface VisitDao {

	public int insert(VisitDto dto);
	public int delete(String no);
	public int delete_group(String group);
	public ArrayList<VisitDto> list(VisitDto dto);
	public VisitDto getUserNo(String no);
	public void insert_reply(VisitDto dto);
}
