package com.gigeroa.vtv.web;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.gigeroa.vtv.dto.DtoVehiculos;
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

//		Se prueba cargar un dato desde la base de datos
		ArrayList<Vehiculo> listaVehiculos = (new DtoVehiculos()).listarVehiculos();
		model.addAttribute("listaVehiculos", listaVehiculos);
		
		return "index";
	}
}
