package com.team04.restaurant;

import java.util.Date;

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
	private String shopSite;
	private String shopCategory;
	private String shopSeat;
	private String memberNo;
	private String shopAddress;
	private String registerDate;
	private double lat;
	private double lng;
	private int state;
	private String status;

	
}
