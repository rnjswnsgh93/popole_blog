package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.MemberDto;
@Mapper
public interface IMemberDao {
	public int insert(MemberDto dto);
	public MemberDto loginCheck(MemberDto dto); 
	public MemberDto getUser(String id);
	public ArrayList<MemberDto> list(@Param("pagenum")String pagenum,@Param("pagelast")String pagelast);
	public void updateMember(MemberDto dto);
	public int deleteMember(String id); 
	public int idCheck(String id);
	public int count_member();
}
