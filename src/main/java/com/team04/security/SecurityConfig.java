package com.team04.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

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
				.permitAll()
				.failureUrl("/signInPage?error")
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
			
}
