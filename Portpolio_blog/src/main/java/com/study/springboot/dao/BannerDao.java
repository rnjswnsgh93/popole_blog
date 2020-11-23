package com.study.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.study.springboot.dto.BannerDto;

@Mapper
public interface BannerDao {

	public int updateBanner(BannerDto dto);
	public BannerDto getBanner(String id);
	}
