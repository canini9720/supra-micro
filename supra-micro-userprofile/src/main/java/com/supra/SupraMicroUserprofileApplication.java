package com.supra;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
//@EnableAutoConfiguration
//@ComponentScan(basePackages="com.supra")
//@EnableJpaRepositories("com.supra.respository")
public class SupraMicroUserprofileApplication {

	public static void main(String[] args) {
		SpringApplication.run(SupraMicroUserprofileApplication.class, args);
	}

}
