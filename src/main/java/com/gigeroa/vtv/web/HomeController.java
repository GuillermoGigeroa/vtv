package com.gigeroa.vtv.web;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.gigeroa.vtv.dto.*;
import com.gigeroa.vtv.entities.*;

@Controller
public class HomeController {
	private String titulo;
	
	@GetMapping ("/")
	public String inicio (Model model) {
//		Se agrega un título para mostrar.
		titulo = "Inicio - Proyecto VTV";
		model.addAttribute("titulo", titulo);
		
//		Se prueba cargar datos desde la base de datos a una lista - Vehiculos
		ArrayList<Vehiculo> listaVehiculos = (new DtoVehiculos()).listarVehiculos();
		model.addAttribute("listaVehiculos", listaVehiculos);
		
//		Se prueba cargar datos desde la base de datos a una lista - Propietarios
		ArrayList<Propietario> listaPropietarios = (new DtoPropietarios()).listarPropietarios();
		model.addAttribute("listaPropietarios", listaPropietarios);
		
//		Se prueba cargar datos desde la base de datos a una lista - Inspectores
		ArrayList<Inspector> listaInspectores = (new DtoInspectores()).listarInspectores();
		model.addAttribute("listaInspectores", listaInspectores);
		
//		Se prueba cargar datos desde la base de datos a una lista - Inspecciones
		ArrayList<Inspeccion> listaInspecciones = (new DtoInspecciones()).listarInspecciones();
		model.addAttribute("listaInspecciones", listaInspecciones);
		
		return "index";
	}

}
