package com.team04.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.cors().and().csrf().disable().authorizeRequests()
//			경로 "/"에 대한 모든 요청 허가
			.antMatchers("/").permitAll()
//			"/signInMethod" 에 대해 로그인 요구
//			.antMatchers("/signInMethod").authenticated()
			.and()
//			.formLogin()
//				.loginPage("/signInPage")
//				.permitAll()
//			.and()
			.logout()
				.permitAll();
	}

	
//	@Bean
//	@Override
//	public UserDetailsService userDetailsService() {
//		UserDetails user = User.withDefaultPasswordEncoder()
//					.username("user")
//					.password("1234")
//					.roles("USER")
//					.build();
//		
//			return new InMemoryUserDetailsManager(user);
//	}
}
