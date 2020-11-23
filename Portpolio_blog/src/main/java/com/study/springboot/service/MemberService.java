package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.IMemberDao;
import com.study.springboot.dto.MemberDto;

@Service
public class MemberService implements IMemberDao{
	@Autowired
	IMemberDao dao;

	@Override
	public int insert(MemberDto dto) {
		int result=dao.insert(dto);
		return result;
	}

	@Override
	public MemberDto loginCheck(MemberDto dto) {
		MemberDto Dto=dao.loginCheck(dto);
		return Dto;
	}

	@Override
	public MemberDto getUser(String id) {
		MemberDto dto=dao.getUser(id);
		return dto;
	}


	@Override
	public void updateMember(MemberDto dto) {
		dao.updateMember(dto);
		
	}

	@Override
	public int deleteMember(String id) {
		dao.deleteMember(id);
		return 0;
	}

	@Override
	public int idCheck(String id) {
		int result=dao.idCheck(id);
		return result;
	}

	@Override
	public ArrayList<MemberDto> list(String pagenum, String pagelast) {
		
		return dao.list(pagenum, pagelast);
	}

	@Override
	public int count_member() {
		
		return dao.count_member();
	}
	
}
