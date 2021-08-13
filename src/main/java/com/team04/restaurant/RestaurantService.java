package com.team04.restaurant;

import java.util.List;

import org.springframework.stereotype.Repository;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team04.member.MemberDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Repository
@Slf4j

public class RestaurantService implements RestaurantDao {
	
	@Autowired
	private RestaurantDao restaurantDao;

	@Override
	public List<RestaurantDto> selectRestaurantList() {

		log.debug("### 식당서비스테스트");
		return restaurantDao.selectRestaurantList();
	}

	@Override
	public RestaurantDto selectRestaurant(String shopNo) {
		return restaurantDao.selectRestaurant(shopNo);
	}
	
	//유정
	@Override
	public List<RestaurantDto> selectShopList() {
		return restaurantDao.selectShopList();
	}

}
