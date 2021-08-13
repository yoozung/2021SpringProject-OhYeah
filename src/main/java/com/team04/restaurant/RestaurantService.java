package com.team04.restaurant;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.member.MemberDao;

@Service

public class RestaurantService implements RestaurantDao {

	@Autowired
	private RestaurantDao restaurantDao;
	
	
	@Override
	public List<RestaurantDto> selectrestaurantList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public RestaurantDto selectRestaurant(String shopNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<RestaurantDto> selectShopList() {
		return restaurantDao.selectShopList();
	}

//	@Override
//	public List<RestaurantDto> selectShopList(String status) {
//		return restaurantDao.selectShopList(status);
//	}

}
