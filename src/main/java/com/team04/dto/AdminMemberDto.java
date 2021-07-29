package com.team04.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude={"password"})
@Builder
public class AdminMemberDto {
	private String name;
	@Setter
	private String mobile;
	@Setter
	private String email;
	private String password;
	private String entrydate;
}
