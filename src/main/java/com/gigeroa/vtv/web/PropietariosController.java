package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping (value = {"/listaPropietarios", "/listaPropietarios/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String listaPropietarios (Model model) {
		ControllersService.setTitulo(model, "Lista de propietarios");
		listarPropietarios(model);
		return listaPropietarios;
	}
	
	@RequestMapping (value = {"/agregarPropietario", "/agregarPropietario/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String agregarPropietarios (Model model) throws DniInvalido {
		ControllersService.setTitulo(model, "Agregar propietario");
		model.addAttribute("propietario",new Propietario());
		return agregarPropietario;
	}

	@RequestMapping (value = {"/altaPropietario","/altaPropietario/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String altaPropietarios (Model model, Propietario propietario) {
		ControllersService.setTitulo(model, "Agregar propietario");
		return agregarPropietario;
	}
	
	@RequestMapping (value = {"/editarPropietario","/editarPropietario/{dni}"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String editar (Model model, @PathVariable (required = false) Integer dni) {
		if (dni == null) {return "redirect:/listaPropietarios";}
		ControllersService.setTitulo(model,"En desarrollo - DNI: "+dni);
		return "home/index";
	}

	@RequestMapping (value = {"/eliminarPropietario","/eliminarPropietario/{dni}"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String eliminar (Model model, @PathVariable (required = false) Integer dni) {
		if (dni == null) {return "redirect:/listaPropietarios";}
		ControllersService.setTitulo(model,"En desarrollo - DNI: "+dni);
		return "home/index";
	}
	
//	Método para listar los propietarios
	private void listarPropietarios(Model model) {
		model.addAttribute("listaPropietarios", dtoPyV.listar());
	}
}
