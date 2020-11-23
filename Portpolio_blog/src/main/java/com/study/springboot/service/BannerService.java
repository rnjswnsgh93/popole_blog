package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.BannerDao;
import com.study.springboot.dto.BannerDto;

@Service
public class BannerService implements BannerDao{

	@Autowired
	BannerDao dao;
	
	@Override
	public int updateBanner(BannerDto dto) {
		int result=dao.updateBanner(dto);
		System.out.println("result="+result);
		return result;
		
	}
	@Override
	public BannerDto getBanner(String id) {
		BannerDto dto=dao.getBanner(id);
		return dto;
	}

}
