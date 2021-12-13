package com.gigeroa.vtv.services;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.Vehiculo;

@Controller
public class HomeController {
	
	@Value ("${index.titulo}")
	private String titulo;
	
	@GetMapping ("/")
	public String inicio(Model model) {
//		Se prueba cargar un dato que se trae desde el application.properties
		model.addAttribute("titulo", titulo);

//		Se prueba cargar un dato desde la base de datos
		Vehiculo vehiculo = ((new DtoVehiculos()).listarVehiculos()).get(0);
		model.addAttribute("vehiculo", vehiculo);
		model.addAttribute("propietario", vehiculo.getPropietario());

//		Se prueba cargar un dato desde el scope local
		String mensaje = "Mensaje escrito con Thymeleaf";
		model.addAttribute("mensaje", mensaje);

		return "index";
	}
}
