//package com.team04.security;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.security.crypto.factory.PasswordEncoderFactories;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Service;
//
//import com.team04.member.MemberDto;
//import com.team04.member.MemberService;
//
//@Service
//public class CustomUserDetailsService implements UserDetailsService {
//
//	@Autowired
//	private MemberService memberService;
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		MemberDto member = memberService.findByEmail(username);
//		UserDetails userDetails = null;
//		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
//
//		org.springframework.security.core.userdetails.User.UserBuilder builder =
//	            org.springframework.security.core.userdetails.User.builder()
//	            .passwordEncoder(encoder::encode);
//		
//		if(member != null) {
//			userDetails = builder
//					.username(member.getName())
//					.password(member.getPassword())
//					.roles(member.getRole())
//					.build();					
//		}
//		
//		return userDetails;
//	}
//
//}
