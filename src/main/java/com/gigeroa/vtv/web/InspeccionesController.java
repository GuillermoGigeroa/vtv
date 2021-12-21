package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.gigeroa.vtv.dto.DtoInspeccionesImpl;
import com.gigeroa.vtv.services.ControllersService;

@Controller
public class InspeccionesController {
	@Autowired
	DtoInspeccionesImpl dto;
	
	@GetMapping ("/listarInspecciones")
	public String listarInspecciones (Model model) {
		ControllersService.setTitulo(model, "Lista de inspecciones");
//		Se trae lista de inspecciones
		model.addAttribute("listaInspecciones", dto.listar());
		return "inspecciones/listarInspecciones";
	}
	
	@GetMapping("/agregarInspeccion")
	public String agregarInspecciones (Model model) {
		ControllersService.setTitulo(model, "Agregar inspeccion");
		return "inspecciones/agregarInspeccion";
	}
}
