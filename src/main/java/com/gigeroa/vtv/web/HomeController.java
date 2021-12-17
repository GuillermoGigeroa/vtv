package com.gigeroa.vtv.web;

import java.util.ArrayList;
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
	
	enum Usuario {
		ADMIN("admin","admin"), USUARIO("user","user"), INTERNO("interno","interno");

		private String userName;
		private String password;
		
		private Usuario(String userName, String password) {
			this.userName = userName;
			this.password = password;
		}
		
		public String getUserName() {
			return userName;
		}
		
		public String getPassword() {
			return password;
		}
	}
	
	@GetMapping ("/")
	public String inicioGet (Model model) {
		model.addAttribute("titulo", tituloIndex);

		ArrayList<MarcaVehiculo> listaMarcas = (new DtoVehiculos()).listarMarcas();
		model.addAttribute("listaMarcas",listaMarcas);
		model.addAttribute("marcaVehiculo",listaMarcas.get(0));
		return "home/index";
	}

	@GetMapping ("/seleccion")
	public String seleccion (Model model, @RequestParam int ID) {
		ArrayList<MarcaVehiculo> listaMarcas = (new DtoVehiculos()).listarMarcas();
		model.addAttribute("marcaSeleccionada",listaMarcas.get(ID-1));
		return inicioGet(model);
	}
	
	@GetMapping ("/index")
	public String index (Model model) {
		return inicioGet(model);
	}

}
