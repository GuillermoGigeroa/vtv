package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InspeccionesController {
	private String titulo;
	
	@GetMapping ("/listarInspecciones")
	public String listarInspecciones (Model model) {
		titulo = "Listar inspecciones 2";
		model.addAttribute("titulo",titulo);
		return "listarInspecciones";
	}
	
	@GetMapping("/agregarInspeccion")
	public String agregarInspecciones (Model model) {
		titulo = "Agregar inspeccion";
		model.addAttribute("titulo",titulo);
		return "agregarInspeccion";
	}
}
