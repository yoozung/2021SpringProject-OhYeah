//package com.team04.security;
//
//import java.util.Arrays;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import com.team04.member.MemberDto;
//import com.team04.member.MemberService;
//
//import lombok.extern.slf4j.Slf4j;
//
//@Service
//@Slf4j
//public class CustomUserDetailService02 implements UserDetailsService {
//	
//	@Autowired
//	private MemberService ms;
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		MemberDto member = ms.findByEmail(username);
//		return new User(
//				member.getName(),
//				member.getPassword(), 
//				Arrays.asList(new SimpleGrantedAuthority(member.getRole()))
//				);
//	}
//	
////	@Override
////	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
////		MemberDto member = ms.findByEmail(username);
//////		return new User(member.getName(), member.getPassword(), 
//////				Arrays.asList(new SimpleGrantedAuthority(member.getRole())));
////		return User.builder()
////				.username(username)
////				.password(member.getPassword())
////				.roles(member.getRole())
////				.build();
////	}
//	
//	
//}
