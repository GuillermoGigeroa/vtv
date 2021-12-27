package com.gigeroa.vtv.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PruebasRest {
	
	@GetMapping ("/hello-world")
	public String helloWorld (){
		return "Hello world";
	}
}
