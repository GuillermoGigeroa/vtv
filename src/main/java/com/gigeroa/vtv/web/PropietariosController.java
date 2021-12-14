package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PropietariosController {
	private String titulo;
	
	@GetMapping("/listarPropietarios")
	public String listarPropietarios (Model model) {
		titulo = "Listar propietarios";
		model.addAttribute("titulo",titulo);
		return "propietarios/listarPropietarios";
	}
	
	@GetMapping("/agregarPropietario")
	public String agregarPropietarios (Model model) {
		titulo = "Agregar propietario";
		model.addAttribute("titulo",titulo);
		return "propietarios/agregarPropietario";
	}
}
