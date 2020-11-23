package com.study.springboot.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.ManagerDao;
import com.study.springboot.dto.ManagerDto;
import com.study.springboot.dto.MemberDto;

@Service
public class ManagerService implements ManagerDao {
	@Autowired
	ManagerDao dao;
	
	
	@Override
	public ArrayList<ManagerDto> mypagelist(String id,String page,String pagelast) {
		
		return dao.mypagelist(id,page,pagelast);
	}

	@Override
	public ArrayList<ManagerDto> asidelist(ManagerDto dto) {
		ArrayList<ManagerDto> list=dao.asidelist(dto);
		return list;
	}

	@Override
	public int idCheck(String id) {
		int result=dao.idCheck(id);
		return result;
	}

	@Override
	public ArrayList<ManagerDto> memberwritelist(@Param("pagenum")String page,@Param("pagelast")String pagelast) {
		ArrayList<ManagerDto> list=dao.memberwritelist(page,pagelast);
		return list;
	}

	@Override
	public void delete(String no) {
		dao.delete(no);
		
	}

	@Override
	public ArrayList<ManagerDto>searchlist(String search,String page,String pagelast) {
		
		return dao.searchlist(search,page,pagelast);
	}

	@Override
	public int search_count(String search) {
		int result=dao.search_count(search);
		return result;
	}

	@Override
	public int manager_writelist_count() {
	
		return dao.manager_writelist_count();
	}

	@Override
	public int mypagelist_count(String id) {
		
		return dao.mypagelist_count(id);
	}



}
