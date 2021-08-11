package com.team04.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
//				.antMatchers("/", "/resource/**", "/signUpPage", "/findByName", "/test111", "/admin/**").permitAll()
				.anyRequest().permitAll()
				.and()
			.formLogin()
				.loginPage("/signInPage")
				.loginProcessingUrl("/signInPage/SignIn")
				.usernameParameter("account") // Form Parameter Catch
				.passwordParameter("password") // Form Parameter Catch
				.successHandler(new MySignSuccessHandler())
				.failureUrl("/signInPage?error")
				.permitAll()
				.and()
			.oauth2Login()
				.defaultSuccessUrl("/")
				.successHandler(new MySignSuccessHandler())
			.and()
//			.httpBasic()
//				.and()
			.logout()
				.clearAuthentication(true)
				.invalidateHttpSession(true)
				.logoutSuccessUrl("/")
				.permitAll();
	}
	
//	@Bean
//	@Override
//	public UserDetailsService userDetailsService() {		
//		UserDetails user =  User.withDefaultPasswordEncoder()
//				.username("PMJ")
//				.password("1234")
//				.roles("USER")
//				.build();
//		
//		UserDetails admin = User.withDefaultPasswordEncoder()
//		        .username("admin")
//		        .password("1234")
//		        .roles("USER", "ADMIN")
//		        .build();
//	
//		return new InMemoryUserDetailsManager(user, admin);
//	}
	
//	@Bean
//	public PasswordEncoder passwordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
	
//	@Bean
//	public JdbcUserDetailService customUserDetailsService() throws Exception {
//		return new JdbcUserDetailService();
//	}
//	
//	@Override
//	public void configure(AuthenticationManagerBuilder auth) throws Exception {
//		auth
//			.userDetailsService(customUserDetailsService());
////			.passwordEncoder(passwordEncoder());
//	}
	
			
}
