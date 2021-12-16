package com.gigeroa.vtv.web;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.MarcaVehiculo;

@Controller
public class HomeController {
//	Se agrega un título para mostrar en inicio.
	private final String tituloIndex = "Inicio - Proyecto VTV";
	
	@GetMapping ("/")
	public String inicioGet (Model model) {
		model.addAttribute("titulo", tituloIndex);

//		Pruebas de enum
		ArrayList<MarcaVehiculo> listaMarcas = (new DtoVehiculos()).listarMarcas();
		model.addAttribute("listaMarcas",listaMarcas);
		
		return "home/index";
	}

	@GetMapping ("/index")
	public String index (Model model) {
		model.addAttribute("titulo", tituloIndex);
		return inicioGet(model);
	}

}
