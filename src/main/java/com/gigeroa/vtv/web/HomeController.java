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
		titulo = "Inicio - Proyecto VTV";
//		Se agrega un título para mostrar.
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
	
	@GetMapping("/listarInspecciones")
	public String listarInspecciones (Model model) {
		titulo = "Listar inspecciones";
		model.addAttribute("titulo",titulo);
		return "listarInspecciones";
	}

	@GetMapping("/agregarInspeccion")
	public String agregarInspecciones (Model model) {
		titulo = "Agregar inspeccion";
		model.addAttribute("titulo",titulo);
		return "agregarInspeccion";
	}

	@GetMapping("/listarInspectores")
	public String listarInspectores (Model model) {
		titulo = "Listar inspectores";
		model.addAttribute("titulo",titulo);
		return "listarInspectores";
	}
	
	@GetMapping("/agregarInspector")
	public String agregarInspector (Model model) {
		titulo = "Agregar inspector";
		model.addAttribute("titulo",titulo);
		return "agregarInspector";
	}

	@GetMapping("/listarVehiculos")
	public String listarVehiculos (Model model) {
		titulo = "Listar vehículos";
		model.addAttribute("titulo",titulo);
		return "listarVehiculos";
	}
	
	@GetMapping("/agregarVehiculo")
	public String agregarVehiculo (Model model) {
		titulo = "Agregar vehículo";
		model.addAttribute("titulo",titulo);
		return "agregarVehiculo";
	}

	@GetMapping("/listarPropietarios")
	public String listarPropietarios (Model model) {
		titulo = "Listar propietarios";
		model.addAttribute("titulo",titulo);
		return "listarPropietarios";
	}
	
	@GetMapping("/agregarPropietario")
	public String agregarPropietarios (Model model) {
		titulo = "Agregar propietario";
		model.addAttribute("titulo",titulo);
		return "agregarPropietario";
	}

}
