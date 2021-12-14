package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VehiculosController {
	private String titulo;
	
	@GetMapping("/listarVehiculos")
	public String listarVehiculos (Model model) {
		titulo = "Listar vehículos";
		model.addAttribute("titulo",titulo);
		return "vehiculos/listarVehiculos";
	}
	
	@GetMapping("/agregarVehiculo")
	public String agregarVehiculo (Model model) {
		titulo = "Agregar vehículo";
		model.addAttribute("titulo",titulo);
		return "vehiculos/agregarVehiculo";
	}
}
