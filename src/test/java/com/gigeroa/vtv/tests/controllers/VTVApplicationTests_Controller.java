package com.gigeroa.vtv.tests.controllers;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import com.gigeroa.vtv.rest.PruebasRest;

@WebMvcTest (PruebasRest.class)
public class VTVApplicationTests_Controller {
	@Autowired
	private MockMvc mockMvc;
	
	@Test
	public void helloWorld_basic() throws Exception {
		//Call GET /hello-world application/json
		RequestBuilder request = MockMvcRequestBuilders
				.get("/api/hello-world")
				.accept(MediaType.APPLICATION_JSON);
		MvcResult result = mockMvc.perform(request)
				.andExpect(status().isOk())
				.andExpect(content().string("Hello world"))
				.andReturn();
		
		//Verificar "Hello world"
		assertEquals("Hello world", result.getResponse().getContentAsString());
	}
}
