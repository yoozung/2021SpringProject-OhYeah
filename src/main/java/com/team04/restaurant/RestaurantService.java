package com.team04.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service

public class RestaurantService implements RestaurantDao {
	@Autowired
	private RestaurantDao restaurantDao;
	
	@Override
	public List<RestaurantDto> selectRestaurantList() {
		return restaurantDao.selectRestaurantList();
	}

	@Override
	public RestaurantDto selectRestaurant(String shopNo) {
		return restaurantDao.selectRestaurant(shopNo);
	}
	
	

	

}
