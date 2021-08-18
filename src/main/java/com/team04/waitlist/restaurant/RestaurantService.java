package com.team04.restaurant;

import java.util.List;
import org.springframework.stereotype.Repository;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.member.MemberDao;
import com.team04.member.MemberDto;
import com.work.util.Utility;

import lombok.extern.slf4j.Slf4j;
@Service
@Repository
@Slf4j

public class RestaurantService implements RestaurantDao {
    
	
	@Autowired
	private RestaurantDao restaurantDao;

	//	@Override
//	public List<RestaurantDto> selectRestaurantList() {
//		return restaurantDao.selectRestaurantList();
//	}

	@Override
	public List<RestaurantDto> selectRestaurantList() {

		log.debug("### 식당서비스테스트");
		return restaurantDao.selectRestaurantList();
	}

	@Override
	public RestaurantDto selectRestaurant(String shopNo) {
		return restaurantDao.selectRestaurant(shopNo);
	}	

	/** 사업자식당조회 */
	@Override
	public List<RestaurantDto> ownerShopList(String memberNo) {
		log.debug("#### 서비스");
		return restaurantDao.ownerShopList(memberNo);
	}

	/** 사업자 식당 등록 */
	@Override
	public int insertShop(RestaurantDto dto) {
		String shopNo = "";
		shopNo += dto.getShopName().substring(0, 1);
		for(int i =0; i < 5; i++) {
		  shopNo += Integer.toString((int) Math.round(Math.random()*9));
		}
		dto.setShopNo(shopNo);
		dto.setRegisterDate(Utility.getCurrentDate());
		dto.setLat(0);
		dto.setLng(0);
		dto.setState(0);
		dto.setStatus("apply");
		int result = restaurantDao.insertShop(dto);
		log.debug("dao result: " + result);
		return result;
	}
	
	/** 관리자식당조회 */
    @Override
    public List<RestaurantDto> selectShopList() {
        return restaurantDao.selectShopList();
    }
    
    @Override
    public List<RestaurantDto> selectShopListPart(int startRow, int endRow) {
    	return restaurantDao.selectShopListPart(startRow, endRow);
    }



}
