package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
//	Se agrega un título para mostrar en inicio.
	private final String tituloIndex = "Inicio - Proyecto VTV";

	public enum Marca {
		FORD("Ford"), FIAT("Fiat"), TOYOTA("Toyota"), VOLKSWAGEN("Volkswagen");
		private String nombre;
		
		private Marca (String nombre) {
			this.nombre = nombre;
		}
		
		public String getNombre() {
			return nombre;
		}
	}
	
	@GetMapping ("/")
	public String inicio (Model model) {
		model.addAttribute("titulo", tituloIndex);

//		Pruebas de enum
		model.addAttribute("marcas",Marca.values());
		
		return "home/index";
	}

	@GetMapping ("/index")
	public String index (Model model) {
		model.addAttribute("titulo", tituloIndex);
		
		return "home/index";
	}

}
