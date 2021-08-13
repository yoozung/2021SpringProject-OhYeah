package com.team04.waitlist;

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
public class WaitListDto {
	private int waitNo;
	private String waitName;
	private int headCount;
	private String waitMobile;
	private String shopName;
	private String shopNo;
	private String waitDate;
	private String waitState;
}
