package com.supra;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

@SpringBootApplication
@EnableResourceServer
@EnableEurekaClient
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SupraMicroUserprofileApplication {

	public static void main(String[] args) {
		SpringApplication.run(SupraMicroUserprofileApplication.class, args);
	}

}
