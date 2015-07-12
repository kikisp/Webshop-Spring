package com.config;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.webstore.service.WebStoreService;
import com.webstore.service.WebStoreServiceImpl;

@Configuration
public class CoreServiceTestConfig {
	
	@Bean
	public WebStoreService getWebStoreService() {
		return new WebStoreServiceImpl();
	}
	
	@Bean
	public SessionFactory getSesstionFactory() {
		return (SessionFactory) new org.springframework.orm.hibernate4.LocalSessionFactoryBean();
	}

}
