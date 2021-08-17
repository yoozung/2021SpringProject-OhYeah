package com.team04.restaurant;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface RestaurantDao {

	/** 전체목록조회*/
	public List<RestaurantDto> selectRestaurantList();
	
	
	/** 상세목록조회*/
	public RestaurantDto selectRestaurant(String shopNo);	

	/** 유정 사업자 식당조회*/
	public List<RestaurantDto> ownerShopList(String memberNo);

	/** 유정 사업자: 식당 등록 */
	public int insertShop(RestaurantDto dto);

//	/** 유정 사업자: 식당 변경 첫화면 */
//	public RestaurantDto ownerShopUpdate(String shopNo);
	
	/** 유정 전체식당조회*/
	public List<RestaurantDto> selectShopList();
	
	/** MJ paging 전체식당조회*/
	@Select("SELECT * FROM (SELECT ROWNUM NUM, R.* FROM restaurant R) WHERE NUM BETWEEN #{startRow} AND #{endRow}")
	public List<RestaurantDto> selectShopListPart(int startRow, int endRow);






}
