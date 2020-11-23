package com.study.springboot.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.study.springboot.dto.AccountDto;

@Mapper
public interface AccountDao {
	public int insert(AccountDto dto);
	public int delete(String no);
	public void updateAccount(AccountDto dto);
	public AccountDto getUserNo(String no);
	public ArrayList<AccountDto> getUserId(String id);	
	public int count(String id);
	public ArrayList<AccountDto> accountlist(@Param("id")String id,@Param("pagenum")String pagenum,@Param("pagelast")String pagelast);	

}
