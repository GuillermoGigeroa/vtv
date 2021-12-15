package com.gigeroa.vtv.web;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gigeroa.vtv.dto.DtoPropietarios;
import com.gigeroa.vtv.entities.Propietario;

@Controller
public class PropietariosController {
	private String titulo;
	
	@GetMapping("/listarPropietarios")
	public String listarPropietarios (Model model) {
		titulo = "Lista de propietarios";
		model.addAttribute("titulo",titulo);
		
//		Se trae lista de propietarios
		ArrayList<Propietario> listaPropietarios = (new DtoPropietarios()).listarPropietarios();
		model.addAttribute("listaPropietarios", listaPropietarios);
		
		return "propietarios/listarPropietarios";
	}
	
	@GetMapping("/agregarPropietario")
	public String agregarPropietarios (Model model) {
		titulo = "Agregar propietario";
		model.addAttribute("titulo",titulo);
		return "propietarios/agregarPropietario";
	}
}
