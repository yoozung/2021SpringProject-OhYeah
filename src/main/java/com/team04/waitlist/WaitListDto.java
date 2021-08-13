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
	private String waitNo;
	private String waitName;
	private int headCount;
	private String waitMobile;
	private String shopName;
	private String shopNo;
	private Date waitDate;
	private String waitStatus;
}
