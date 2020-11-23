package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.DailyDao;
import com.study.springboot.dto.DailyDto;

@Service
public class DailyService implements DailyDao {

	@Autowired
	DailyDao dao;
	
	@Override
	public int insert(DailyDto dto) {
		int result=dao.insert(dto);
		return result;
	}

	@Override
	public int delete(String id) {
		int result=dao.delete(id);
		return result;
	}

	@Override
	public void updateDaily(DailyDto dto) {
		dao.updateDaily(dto);
		
	}

	@Override
	public ArrayList<DailyDto> list(DailyDto dto,String page,String pagelast) {
		ArrayList<DailyDto> list=dao.list(dto,page,pagelast);
		return list;
	}

	@Override
	public int count(String id) {
		int count=dao.count(id);
		return count;
	}

	@Override
	public DailyDto getUserId(String id) {
		DailyDto dto=dao.getUserId(id);
		return dto;
	}

	@Override
	public int hit(String bid) {
		int result=dao.hit(bid);
		return result;
	}

	@Override
	public ArrayList<DailyDto> hitlist(DailyDto dto) {
		ArrayList<DailyDto> hitlist=dao.hitlist(dto);
		return hitlist;
	}

	@Override
	public int daily_count() {
		return dao.daily_count();
	
	}


	

}
