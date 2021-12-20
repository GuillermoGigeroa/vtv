package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.gigeroa.vtv.dto.DtoInspeccionesImpl;

@Controller
public class InspeccionesController {
	private String titulo;
	
	@Autowired
	DtoInspeccionesImpl dto;
	
	@GetMapping ("/listarInspecciones")
	public String listarInspecciones (Model model) {
		titulo = "Lista de inspecciones";
		model.addAttribute("titulo",titulo);
		
//		Se trae lista de inspecciones
		model.addAttribute("listaInspecciones", dto.listarInspecciones());
		
		return "inspecciones/listarInspecciones";
	}
	
	@GetMapping("/agregarInspeccion")
	public String agregarInspecciones (Model model) {
		titulo = "Agregar inspeccion";
		model.addAttribute("titulo",titulo);
		return "inspecciones/agregarInspeccion";
	}
}
