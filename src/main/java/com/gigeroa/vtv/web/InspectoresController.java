package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.gigeroa.vtv.dto.DtoInspectoresImpl;
import com.gigeroa.vtv.entities.Inspector;
import com.gigeroa.vtv.services.ControllersService;

@Controller
public class InspectoresController {
	@Autowired
	DtoInspectoresImpl dto;
	
	@GetMapping("/listarInspectores")
	public String listarInspectores (Model model) {
		ControllersService.setTitulo(model, "Lista de inspectores");
//		Se trae lista de inspectores
		model.addAttribute("listaInspectores", dto.listar());
		
		return "inspectores/listarInspectores";
	}
	
	@GetMapping("/agregarInspector")
	public String agregarInspector (Model model) {
		ControllersService.setTitulo(model, "Alta de inspector");
		model.addAttribute("inspector",new Inspector());
		return "inspectores/agregarInspector";
	}

	@GetMapping("/altaInspector")
	public String agregarInspector2 (Model model, Inspector inspector) {
		ControllersService.setTitulo(model, "Alta de inspector");
		return "inspectores/agregarInspector";
	}
	
	@GetMapping("/editarInspector/{legajo}")
	public String editar (Model model, @PathVariable int legajo) {
		ControllersService.setTitulo(model,"En desarrollo - Legajo: "+legajo);
		return "home/index";
	}

	@GetMapping("/eliminarInspector/{legajo}")
	public String eliminar (Model model, @PathVariable int legajo) {
		ControllersService.setTitulo(model,"En desarrollo - Legajo: "+legajo);
		return "home/index";
	}
}
