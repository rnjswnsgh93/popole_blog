package com.study.springboot.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.AccountDao;
import com.study.springboot.dto.AccountDto;
import com.study.springboot.dto.DailyDto;

@Service
public class AccountService implements AccountDao{
	@Autowired
	AccountDao dao;
	
	@Override
	public int insert(AccountDto dto) {
		int result=dao.insert(dto);
		return result;
	}

	@Override
	public int delete(String no) {
		int result=dao.delete(no);
		return result;
	}

	@Override
	public void updateAccount(AccountDto dto) {
		dao.updateAccount(dto);
		
	}

	@Override
	public ArrayList<AccountDto> getUserId(String id) {
		return dao.getUserId(id);
	}

	@Override
	public AccountDto getUserNo(String no) {
		return dao.getUserNo(no);
	}

	@Override
	public int count(String id) {
		int count=dao.count(id);
		return count;
	}

	@Override
	public ArrayList<AccountDto> accountlist(String id, String page, String pagelast) {
	
		return dao.accountlist(id, page, pagelast);
	}

}
