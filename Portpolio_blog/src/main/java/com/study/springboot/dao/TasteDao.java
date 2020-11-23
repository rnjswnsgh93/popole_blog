package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.TasteDto;
@Mapper
public interface TasteDao {
	public int insert(TasteDto dto);
	public int delete(String id);
	public void updateTaste(TasteDto dto);
	public ArrayList<TasteDto> list(TasteDto dto,@Param("pagenum")String page,@Param("pagelast")String pagelast);
	public ArrayList<TasteDto> hitlist(TasteDto dto);
	public TasteDto getUserId(String id);
	public int count(String id);//id로 글 몇개 있는지
	public int hit(String bid); //조회수
	public int taste_count();
}
