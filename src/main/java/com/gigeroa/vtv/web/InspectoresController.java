package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class InspectoresController {
	private String titulo;
	
	@GetMapping("/listarInspectores")
	public String listarInspectores (Model model) {
		titulo = "Listar inspectores";
		model.addAttribute("titulo",titulo);
		return "listarInspectores";
	}
	
	@GetMapping("/agregarInspector")
	public String agregarInspector (Model model) {
		titulo = "Agregar inspector";
		model.addAttribute("titulo",titulo);
		return "agregarInspector";
	}
}
