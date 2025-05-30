package com.fourstars.greenstore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class GreenstoreApplication {

	public static void main(String[] args) {
		SpringApplication.run(GreenstoreApplication.class, args);
	}

}
