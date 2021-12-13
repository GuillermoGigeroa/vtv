package com.gigeroa.vtv.services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@Value ("${index.titulo}")
	private String titulo;
	
	@GetMapping ("/")
	public String inicio(Model model) {
		String mensaje = "Mensaje escrito con Thymeleaf";
		model.addAttribute("mensaje", mensaje);
		model.addAttribute("titulo", titulo);
		return "index";
	}
}
