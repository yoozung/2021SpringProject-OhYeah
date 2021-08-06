package com.team04.restaurant;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class RestaurantDto {
	private String shopNo;
	private String shopName;
	private String shopMobile;
	private String shopAddress;
	private String businessNumber;
	private String shopSite;
	private String category1;
	private String category2;
	private int shopSeat;
	private String registerDate;
	
}
