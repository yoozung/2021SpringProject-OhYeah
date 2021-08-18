package com.team04.member;

import lombok.AllArgsConstructor;
import lombok.Generated;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude= {"password"})
public class MemberDto {
	@Setter
	private String memberNo;
	private String name;
	@Setter
	private String mobile;
	@Setter
	private String email;
	@Setter
	private String password;
	private String entryDate;
	private String role;
	private int enabled;

}
