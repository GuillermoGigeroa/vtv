package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.gigeroa.vtv.dto.DtoInspectoresImpl;
import com.gigeroa.vtv.entities.Inspector;
import com.gigeroa.vtv.services.ControllersService;

@Controller
public class InspectoresController {
	@Autowired
	DtoInspectoresImpl dto;
	
	@RequestMapping (value = {"/listarInspectores", "/listarInspectores/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String listarInspectores (Model model) {
		ControllersService.setTitulo(model, "Lista de inspectores");
//		Se trae lista de inspectores
		model.addAttribute("listaInspectores", dto.listar());
		return "inspectores/listarInspectores";
	}
	
	@RequestMapping (value = {"/agregarInspector", "/agregarInspector/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String agregarInspector (Model model, Inspector inspector) {
		ControllersService.setTitulo(model, "Alta de inspector");
		return "inspectores/agregarInspector";
	}

	@RequestMapping (value = {"inspectores/alta","inspector/alta/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String agregarInspector2 (Model model, Inspector inspector) {
		ControllersService.setTitulo(model, "Alta de inspector");
		return "inspectores/agregarInspector";
	}
	
	@RequestMapping (value = {"/editarInspector","/editarInspector/{legajo}"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String editar (Model model, @PathVariable (required = false) Integer legajo) {
		if (legajo == null) {
			return "redirect:/listarInspectores";
		}
		ControllersService.setTitulo(model,"En desarrollo - Legajo: "+legajo);
		return "home/index";
	}

	@RequestMapping (value = {"/eliminarInspector","/eliminarInspector/{legajo}"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String eliminar (Model model, @PathVariable (required = false) Integer legajo) {
		if (legajo == null) {
			return "redirect:/listarInspectores";
		}
		ControllersService.setTitulo(model,"En desarrollo - Legajo: "+legajo);
		return "home/index";
	}
}
