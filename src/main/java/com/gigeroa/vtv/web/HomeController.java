package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
//	Se agrega un título para mostrar en inicio.
	private final String titulo = "Inicio - Proyecto VTV";
	
	@GetMapping ("/")
	public String inicioGet (Model model) {
		titulo(model);
		return "home/index";
	}

	@GetMapping ("/index")
	public String index (Model model) {
		return inicioGet(model);
	}
	
	public void titulo(Model model) {
		model.addAttribute("titulo", titulo);
	}
}
