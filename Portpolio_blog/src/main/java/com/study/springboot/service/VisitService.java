package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.VisitDao;
import com.study.springboot.dto.VisitDto;

@Service
public class VisitService implements VisitDao{

	@Autowired
	VisitDao dao;
	
	@Override
	public int insert(VisitDto dto) {
		int result=dao.insert(dto);
		return result;
	}

	@Override
	public int delete(String no) {
		int result=dao.delete(no);
		return result;
	}

	@Override
	public ArrayList<VisitDto> list(VisitDto dto) {
		dao.list(dto);
		return dao.list(dto);
	}

	@Override
	public VisitDto getUserNo(String no) {
		dao.getUserNo(no);
		return dao.getUserNo(no);
	}

	@Override
	public void insert_reply(VisitDto dto) {
		dao.insert_reply(dto);
		
	}

	@Override
	public int delete_group(String group) {
		dao.delete_group(group);
		return dao.delete_group(group);
	}

}
