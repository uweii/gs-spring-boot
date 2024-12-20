package com.example.springboot;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
public class HelloController {

	@GetMapping("/")
	public String index() {
		System.out.println(new Date());
		return "Greetings from Spring Boot!";
	}

}
