package com.team04.member02;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude= {"passowrd"})
public class MemberDto02 {
	private String name;
	private String email;
	private String password;
	private String mobile;
	private String entryDate;
}
