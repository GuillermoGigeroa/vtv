package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.gigeroa.vtv.dto.DtoPropietariosImpl;
import com.gigeroa.vtv.services.ControllersService;

@Controller
public class PropietariosController {
	
	private final String listaPropietarios = "propietarios/listaPropietarios";
	private final String agregarPropietario = "propietarios/agregarPropietario";

	@Autowired
	DtoPropietariosImpl dto;
	
	@GetMapping("/listaPropietarios")
	public String listaPropietarios (Model model) {
		ControllersService.setTitulo(model, "Lista de propietarios");
		listarPropietarios(model);
		return listaPropietarios;
	}
	
	@GetMapping("/agregarPropietario")
	public String agregarPropietarios (Model model) {
		ControllersService.setTitulo(model, "Agregar propietario");
		return agregarPropietario;
	}
	
//	Método para listar los propietarios
	private void listarPropietarios(Model model) {
		model.addAttribute("listaPropietarios", dto.listar());
	}
}
