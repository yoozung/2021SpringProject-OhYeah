package com.team04.config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import com.team04.interceptor.BeforeActionInterceptor;
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	@Autowired
	@Qualifier("needToAdminInterceptor")
	HandlerInterceptor needToAdminInterceptor;
	
	@Autowired
	@Qualifier("needToConsumerInterceptor")
	HandlerInterceptor needToConsumerInterceptor;
	
	@Autowired
	@Qualifier("needToOwnerInterceptor")
	HandlerInterceptor needToOwnerInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new BeforeActionInterceptor())
		.excludePathPatterns("/error", "/", "/main", "/resource/**", "/signInPage", "/signInPage/SignIn", "/maptest");
		
		/**
		 * ROLE_ADMIN 권한이 필요한 서비스
		 */
		registry.addInterceptor(needToAdminInterceptor)
			.addPathPatterns("/adminTemplate")
			.addPathPatterns("/admin/adminMemberList");
			
		
		/**
		 * ROLE_CONSUMER 권한이 필요한 서비스
		 */
		registry.addInterceptor(needToConsumerInterceptor)
			.addPathPatterns("/consumerTemplate");
		
	}
	
}