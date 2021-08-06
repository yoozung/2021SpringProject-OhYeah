package com.team04.member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude= {"password"})
public class MemberDto {
	private String name;
	@Setter
	private String mobile;
	@Setter
	private String email;
	@Setter
	private String password;
	private String entryDate;
}
