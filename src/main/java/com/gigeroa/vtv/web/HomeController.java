package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gigeroa.vtv.services.ControllersService;

@Controller
public class HomeController {
//	Se agrega un título para mostrar en inicio.
	private final String titulo = "Inicio - Proyecto VTV";
	
	@RequestMapping (value = {"/","/index"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String inicioGet (Model model) {
		ControllersService.setTitulo(model, titulo);
		return "home/index";
	}
}
