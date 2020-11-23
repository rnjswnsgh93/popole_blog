package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.ReplyDao;
import com.study.springboot.dto.ReplyDto;

@Service
public class ReplyService implements ReplyDao{

	@Autowired
	ReplyDao dao;
	
	@Override
	public void insert(ReplyDto dto) {
		dao.insert(dto);
		
	}

	@Override
	public void delete(String no) {
		dao.delete(no);
		
	}

	@Override
	public ArrayList<ReplyDto> reply_list(String no) {
		
		return dao.reply_list(no);
	}

	@Override
	public void insert_reply(ReplyDto dto) {
		dao.insert_reply(dto);
		
	}

	@Override
	public int count_reply(String no) {
		
		return dao.count_reply(no);
	}

	@Override
	public ReplyDto getNo(String no) {
		
		return dao.getNo(no);
	}

}
