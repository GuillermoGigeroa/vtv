package com.gigeroa.vtv.web;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.Vehiculo;

@Controller
public class VehiculosController {
	private String titulo;
	
	@GetMapping("/listarVehiculos")
	public String listarVehiculos (Model model) {
		titulo = "Lista de vehículos";
		model.addAttribute("titulo",titulo);
		
//		Se trae lista de vehiculos
		ArrayList<Vehiculo> listaVehiculos = (new DtoVehiculos()).listarVehiculos();
		model.addAttribute("listaVehiculos", listaVehiculos);
		
		return "vehiculos/listarVehiculos";
	}
	
	@GetMapping("/agregarVehiculo")
	public String agregarVehiculo (Model model) {
		titulo = "Agregar vehículo";
		model.addAttribute("titulo",titulo);
		return "vehiculos/agregarVehiculo";
	}
}
