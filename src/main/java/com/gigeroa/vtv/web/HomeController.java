package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.MarcaVehiculo;

@Controller
public class HomeController {
//	Se agrega un título para mostrar en inicio.
	private final String tituloIndex = "Inicio - Proyecto VTV";
	
	@GetMapping ("/")
	public String inicioGet (Model model) {
		titulo(model);
		listarMarcas(model);
		marcaNueva(model);
		return "home/index";
	}

	@GetMapping ("/seleccion")
	public String seleccion (Model model) {
		titulo(model);
		listarMarcas(model);
		marcaNueva(model);
		return "home/index";
	}

	@PostMapping ("/seleccion")
	public String seleccion (Model model, @RequestParam int ID) {
		titulo(model);
		listarMarcas(model);
		marcaSelecionada(model, ID);
		return "home/index";
	}
	
	@GetMapping ("/index")
	public String index (Model model) {
		return inicioGet(model);
	}
	
	public void marcaNueva(Model model) {
		model.addAttribute("marcaVehiculo",new MarcaVehiculo());
	}
	
	public void marcaSelecionada(Model model, int ID) {
		model.addAttribute("marcaVehiculo",(new DtoVehiculos()).listarMarcas().get(ID-1));
	}
	
	public void titulo(Model model) {
		model.addAttribute("titulo", tituloIndex);
	}

	public void listarMarcas(Model model) {
		model.addAttribute("listaMarcas",(new DtoVehiculos()).listarMarcas());
	}
}
