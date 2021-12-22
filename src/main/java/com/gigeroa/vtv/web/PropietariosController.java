package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.gigeroa.vtv.dto.DtoPropietario_y_Vehiculo;
import com.gigeroa.vtv.dto.DtoPropietariosImpl;
import com.gigeroa.vtv.entities.Propietario;
import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.services.ControllersService;

@Controller
public class PropietariosController {
	
	private final String listaPropietarios = "propietarios/listaPropietarios";
	private final String agregarPropietario = "propietarios/agregarPropietario";

	@Autowired
	DtoPropietariosImpl dto;

	@Autowired
	DtoPropietario_y_Vehiculo dtoPyV;
	
	@GetMapping("/listaPropietarios")
	public String listaPropietarios (Model model) {
		ControllersService.setTitulo(model, "Lista de propietarios");
		listarPropietarios(model);
		return listaPropietarios;
	}
	
	@GetMapping("/agregarPropietario")
	public String agregarPropietarios (Model model) throws DniInvalido {
		ControllersService.setTitulo(model, "Agregar propietario");
		model.addAttribute("propietario",new Propietario());
		return agregarPropietario;
	}

	@GetMapping("/altaPropietario")
	public String altaPropietarios (Model model, Propietario propietario) {
		ControllersService.setTitulo(model, "Agregar propietario");
		return agregarPropietario;
	}
	
//	Método para listar los propietarios
	private void listarPropietarios(Model model) {
		model.addAttribute("listaPropietarios", dtoPyV.listar());
	}
	
	@GetMapping("/editarPropietario/{dni}")
	public String editar (Model model, @PathVariable int dni) {
		ControllersService.setTitulo(model,"En desarrollo - DNI: "+dni);
		return "home/index";
	}

	@GetMapping("/eliminarPropietario/{dni}")
	public String eliminar (Model model, @PathVariable int dni) {
		ControllersService.setTitulo(model,"En desarrollo - DNI: "+dni);
		return "home/index";
	}
}
