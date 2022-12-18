package com.oracle.ohTravel.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.oracle.ohTravel.interceptor.ManagerLoginInterCeptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
	
	// 인터셉터 등록
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new ManagerLoginInterCeptor())
			.addPathPatterns("/manager/insertPackage*");
	}
}
