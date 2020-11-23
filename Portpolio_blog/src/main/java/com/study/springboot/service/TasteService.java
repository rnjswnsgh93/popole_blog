package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.TasteDao;
import com.study.springboot.dto.DailyDto;
import com.study.springboot.dto.TasteDto;

@Service
public class TasteService implements TasteDao{

	@Autowired
	TasteDao dao;
	@Override
	public int insert(TasteDto dto) {
	int result=dao.insert(dto);
		return result;
	}

	@Override
	public int delete(String id) {
		int result=dao.delete(id);
		return result;
	}

	@Override
	public void updateTaste(TasteDto dto) {
		dao.updateTaste(dto);
		
	}

	@Override
	public ArrayList<TasteDto> list(TasteDto dto,String page,String pagelast) {
		return dao.list(dto,page,pagelast);
	}

	@Override
	public ArrayList<TasteDto> hitlist(TasteDto dto) {
		
		return dao.hitlist(dto);
	}

	@Override
	public TasteDto getUserId(String id) {
		
		return dao.getUserId(id);
	}

	@Override
	public int count(String id) {
		
		return dao.count(id);
	}

	@Override
	public int hit(String bid) {
		
		return dao.hit(bid);
	}

	@Override
	public int taste_count() {
		
		return dao.taste_count();
	}

}
