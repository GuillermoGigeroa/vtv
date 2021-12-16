package com.gigeroa.vtv.web;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.MarcaVehiculo;

@Controller
public class HomeController {
//	Se agrega un título para mostrar en inicio.
	private final String tituloIndex = "Inicio - Proyecto VTV";
	
	@GetMapping ("/")
	public String inicioGet (Model model) {
		model.addAttribute("titulo", tituloIndex);

		ArrayList<MarcaVehiculo> listaMarcas = (new DtoVehiculos()).listarMarcas();
		model.addAttribute("listaMarcas",listaMarcas);
		model.addAttribute("marcaVehiculo",new MarcaVehiculo(-1, "objetoMarca nombre"));
		return "home/index";
	}

	@GetMapping ("/seleccion")
	public String seleccion (Model model, @RequestParam int ID) {
		model.addAttribute("ID",ID);
		return inicioGet(model);
	}
	
	@GetMapping ("/index")
	public String index (Model model) {
		return inicioGet(model);
	}

}
