package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	private String titulo;
	
	@GetMapping ("/")
	public String inicio (Model model) {
//		Se agrega un título para mostrar.
		titulo = "Inicio - Proyecto VTV";
		model.addAttribute("titulo", titulo);

		return "home/index";
	}

}
