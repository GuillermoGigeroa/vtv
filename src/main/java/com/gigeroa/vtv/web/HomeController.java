package com.gigeroa.vtv.web;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gigeroa.vtv.dto.DtoInspectores;
import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.Inspector;
import com.gigeroa.vtv.entities.Vehiculo;

@Controller
public class HomeController {
	private final String titulo = "Inicio - Proyecto VTV";
	
	@GetMapping ("/")
	public String inicio(Model model) {
//		Se agrega un título para mostrar.
		model.addAttribute("titulo", titulo);

//		Se agrega un mensaje para mostrar.
		String mensaje = "Hola, este es un mensaje de prueba.";
		model.addAttribute("mensaje", mensaje);

//		Se prueba cargar datos desde la base de datos a una lista - Vehiculos
		ArrayList<Vehiculo> listaVehiculos = (new DtoVehiculos()).listarVehiculos();
		model.addAttribute("listaVehiculos", listaVehiculos);

//		Se prueba cargar datos desde la base de datos a una lista - Inspectores
		ArrayList<Inspector> listaInspectores = (new DtoInspectores()).listarInspectores();
		model.addAttribute("listaInspectores", listaInspectores);
		
		
		
		return "index";
	}
}
