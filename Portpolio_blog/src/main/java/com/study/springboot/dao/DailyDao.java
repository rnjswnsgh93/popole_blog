package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.springboot.dto.DailyDto;

@Mapper
public interface DailyDao {
	public int insert(DailyDto dto);
	public int delete(String id);
	public void updateDaily(DailyDto dto);
	public ArrayList<DailyDto> list(DailyDto dto,@Param("pagenum")String page,@Param("pagelast")String pagelast);
	public ArrayList<DailyDto> hitlist(DailyDto dto);
	public DailyDto getUserId(String id);
	public int count(String id);//id로 글 몇개 있는지
	public int hit(String bid); //조회수
	public int daily_count();

	
}
