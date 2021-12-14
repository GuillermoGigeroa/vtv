package com.gigeroa.vtv.web;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gigeroa.vtv.dto.DtoInspecciones;
import com.gigeroa.vtv.entities.Inspeccion;

@Controller
public class InspeccionesController {
	private String titulo;
	
	@GetMapping ("/listarInspecciones")
	public String listarInspecciones (Model model) {
		titulo = "Listar inspecciones";
		model.addAttribute("titulo",titulo);
		
//		Se trae lista de inspecciones
		ArrayList<Inspeccion> listaInspecciones = (new DtoInspecciones()).listarInspecciones();
		model.addAttribute("listaInspecciones", listaInspecciones);
		
		return "inspecciones/listarInspecciones";
	}
	
	@GetMapping("/agregarInspeccion")
	public String agregarInspecciones (Model model) {
		titulo = "Agregar inspeccion";
		model.addAttribute("titulo",titulo);
		return "inspecciones/agregarInspeccion";
	}
}
