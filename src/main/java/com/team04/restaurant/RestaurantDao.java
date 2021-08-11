package com.team04.restaurant;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RestaurantDao {
	/** 전체목록조회*/
	public List<RestaurantDto> selectrestaurantList();
	
	/** 상세목록조회*/
	public RestaurantDto selectRestaurant(String shopNo);
	
}
