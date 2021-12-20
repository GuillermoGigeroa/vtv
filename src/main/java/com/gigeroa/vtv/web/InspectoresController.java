package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.gigeroa.vtv.dto.DtoInspectoresImpl;

@Controller
public class InspectoresController {
	private String titulo;
	
	@Autowired
	DtoInspectoresImpl dto;
	
	@GetMapping("/listarInspectores")
	public String listarInspectores (Model model) {
		titulo = "Lista de inspectores";
		model.addAttribute("titulo",titulo);
		
//		Se trae lista de inspectores
		model.addAttribute("listaInspectores", dto.listarInspectores());
		
		return "inspectores/listarInspectores";
	}
	
	@GetMapping("/agregarInspector")
	public String agregarInspector (Model model) {
		titulo = "Alta de inspector";
		model.addAttribute("titulo",titulo);
		return "inspectores/agregarInspector";
	}
}
