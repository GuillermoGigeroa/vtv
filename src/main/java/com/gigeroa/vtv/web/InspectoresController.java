package com.gigeroa.vtv.web;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gigeroa.vtv.dto.DtoInspectores;
import com.gigeroa.vtv.entities.Inspector;

@Controller
public class InspectoresController {
	private String titulo;
	
	@GetMapping("/listarInspectores")
	public String listarInspectores (Model model) {
		titulo = "Listar inspectores";
		model.addAttribute("titulo",titulo);
		
//		Se trae lista de inspectores
		ArrayList<Inspector> listaInspectores = (new DtoInspectores()).listarInspectores();
		model.addAttribute("listaInspectores", listaInspectores);
		
		return "inspectores/listarInspectores";
	}
	
	@GetMapping("/agregarInspector")
	public String agregarInspector (Model model) {
		titulo = "Agregar inspector";
		model.addAttribute("titulo",titulo);
		return "inspectores/agregarInspector";
	}
}
