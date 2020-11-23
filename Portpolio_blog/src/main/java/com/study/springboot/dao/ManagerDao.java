package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.AccountDto;
import com.study.springboot.dto.ManagerDto;
import com.study.springboot.dto.MemberDto;

@Mapper
public interface ManagerDao {

	public ArrayList<ManagerDto> mypagelist(@Param("id")String id,@Param("pagenum")String page,@Param("pagelast")String pagelast);
	public int mypagelist_count(String id);
	public ArrayList<ManagerDto> asidelist(ManagerDto dto);
	public ArrayList<ManagerDto> memberwritelist(@Param("pagenum")String page,@Param("pagelast")String pagelast);
	public int idCheck(String id);
	public void delete(String no);
	public ArrayList<ManagerDto>  searchlist(@Param("search")String search,@Param("pagenum")String page,@Param("pagelast")String pagelast);
	public int search_count(@Param("search_count")String search);
	public int manager_writelist_count();
}
