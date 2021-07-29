package com.team04.config;

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
	
	// @formatter:off
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.cors().and().csrf().disable().authorizeRequests().and()
				.authorizeRequests((authorize) -> authorize
					.antMatchers("/css/**", "/index").permitAll()
					.antMatchers("/user/**").hasRole("USER")
				)
				.formLogin((formLogin) -> formLogin
					.loginPage("/signInPage")
					.failureUrl("/")
				);
	}
	
	// @formatter:on
	@Bean
	public UserDetailsService userDetailsService() {
		UserDetails userDetails = User.withDefaultPasswordEncoder()
				.username("user")
				.password("password")
				.roles("USER")
				.build();
		return new InMemoryUserDetailsManager(userDetails);
	}
	
//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//		http
////			.cors().and().csrf().disable().authorizeRequests()
////			.and()
//			.authorizeRequests((authorize) -> authorize
//					.antMatchers("/css/**", "/").permitAll()
//					.antMatchers("/user/**").hasRole("USER")
//			)
//			.formLogin()
//				.loginPage("/signInPage")
//				.failureUrl("/signInError");
//	}
//	
//	
//	@Bean
//	public UserDetailsService userDetailsService() {
//		UserDetails user1 = User.withDefaultPasswordEncoder()
//				.username("user")
//				.password("1234")
//				.roles("USER")
//				.build();
//		return new InMemoryUserDetailsManager(user1);
//	}
	
}
