package com.team04.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.team04.member.MemberDto;
import com.team04.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CustomUserDetailService02 implements UserDetailsService {

	private final MemberService ms;
	
	public CustomUserDetailService02(MemberService ms) {
		this.ms = ms;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDto member = ms.findByEmail(username);
		
		if(member.equals(null)) {
			throw new UsernameNotFoundException(username);
		} else {
			UserDetails user = User.withDefaultPasswordEncoder()
				.username(member.getName())
				.password(member.getPassword())
				.roles(member.getRole())
				.build();				
			return user;
		}
	}
}
