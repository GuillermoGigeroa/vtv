package com.gigeroa.vtv.services;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping ("/")
	public String inicio(Model model) {
		String mensaje = "Mensaje escrito con Thymeleaf";
		String titulo = "Inicio - Proyecto VTV";
		model.addAttribute("mensaje", mensaje);
		model.addAttribute("titulo", titulo);
		return "index";
	}
}
