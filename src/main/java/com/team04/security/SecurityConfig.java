package com.team04.security;

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
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
//			.csrf()
//				.ignoringAntMatchers("/signInPage/SignIn").and()
			
			.authorizeRequests()
				.antMatchers("/", "/resource/**", "/findByName", "/test02").permitAll()
				.anyRequest().authenticated()
				.and()
			.formLogin()
				.loginPage("/signInPage")
				.loginProcessingUrl("/signInPage/SignIn")
//				.usernameParameter("username") // Form Parameter Catch
//				.passwordParameter("password") // Form Parameter Catch
				.successHandler(new MySignSuccessHandler())
				.failureUrl("/signInPage?error")
				.permitAll()				
				.and()
			.httpBasic()
				.and()
			.logout()
				.logoutSuccessUrl("/")
				.permitAll();
	}		
		
//	@Bean
//	@Override
//	public UserDetailsService userDetailsService() {		
//		UserDetails user =
//			 User.withDefaultPasswordEncoder()
//				.username("PMJ")
//				.password("1234")
//				.roles("ADMIN")
//				.build();
//	
//		return new InMemoryUserDetailsManager(user);
//	}
	
//	@Bean
//	public static PasswordEncoder passwordEncoder() {
//		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
//	}
			
}
