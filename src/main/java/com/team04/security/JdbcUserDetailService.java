//package com.team04.security;
//
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
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
//@Service
//public class JdbcUserDetailService implements UserDetailsService {
//	
//	@Autowired
//	private MemberService ms;
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		MemberDto member = ms.findByEmail(username);	
//		return new User(
//					member.getEmail(),
//					member.getPassword(),
//					Arrays.asList(new SimpleGrantedAuthority(member.getRole()))
//				);
//	}	
//	
//}