package com.team04.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
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
		
		if(!member.equals(null)) {
			List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			authorities.add(new SimpleGrantedAuthority(member.getRole()));
			
			return new User(
					member.getName(),
					member.getPassword(),
					authorities
			);
		}
		return null;
		
//		if(member.equals(null)) {
//			throw new UsernameNotFoundException(username);
//		} else {
//			UserDetails user = User.withDefaultPasswordEncoder()
//				.username(member.getName())
//				.password(member.getPassword())
//				.roles(member.getRole())
//				.build();				
//			return user;
//		}
	}
}
