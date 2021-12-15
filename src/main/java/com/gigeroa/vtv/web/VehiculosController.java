package com.gigeroa.vtv.web;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.MarcaVehiculo;
import com.gigeroa.vtv.entities.ModeloVehiculo;
import com.gigeroa.vtv.entities.Vehiculo;
import com.gigeroa.vtv.services.MatriculasService;

@Controller
public class VehiculosController {
	private String titulo;
	
	@GetMapping("/listarVehiculos")
	public String listarVehiculos (Model model) {
		titulo = "Lista de vehículos";
		model.addAttribute("titulo",titulo);
		
//		Se trae lista de vehiculos
		ArrayList<Vehiculo> listaVehiculos = (new DtoVehiculos()).listarVehiculos();
		model.addAttribute("listaVehiculos", listaVehiculos);
		
//		Prueba 1 del método existeMatricula
		String matricula1 = "AA458RT";
		model.addAttribute("matricula1",matricula1);
		model.addAttribute("existeMatricula1",MatriculasService.existeMatricula(matricula1));

//		Prueba 1 del método existeMatricula
		String matricula2 = "EZR271";
		model.addAttribute("matricula2",matricula2);
		model.addAttribute("existeMatricula2",MatriculasService.existeMatricula(matricula2));
		
		return "vehiculos/listarVehiculos";
	}
	
	@GetMapping("/agregarVehiculo")
	public String agregarVehiculo (Model model) {
		titulo = "Agregar vehículo";
		model.addAttribute("titulo",titulo);

		DtoVehiculos dto = new DtoVehiculos();
		
//		Se trae lista de marcas
		ArrayList<MarcaVehiculo> listaMarcas = dto.listarMarcas();
		model.addAttribute("listaMarcas", listaMarcas);

//		Se trae lista de los modelos de la marca Chevrolet
		int ID1 = 14;
		ArrayList<ModeloVehiculo> listaModelos1 = dto.listarModelos(ID1);
		model.addAttribute("ID1", ID1);
		model.addAttribute("listaModelos1", listaModelos1);

//		Se trae lista de los modelos de la marca Fiat
		int ID2 = 25;
		ArrayList<ModeloVehiculo> listaModelos2 = dto.listarModelos(ID2);
		model.addAttribute("listaModelos2", listaModelos2);
		model.addAttribute("ID2", ID2);

//		Se trae lista de los modelos de la marca Ford
		int ID3 = 26;
		ArrayList<ModeloVehiculo> listaModelos3 = dto.listarModelos(ID3);
		model.addAttribute("listaModelos3", listaModelos3);
		model.addAttribute("ID3", ID3);

//		Se trae lista de los modelos de la marca Toyota
		int ID4 = 74;
		ArrayList<ModeloVehiculo> listaModelos4 = dto.listarModelos(ID4);
		model.addAttribute("listaModelos4", listaModelos4);
		model.addAttribute("ID4", ID4);
		
		return "vehiculos/agregarVehiculo";
	}
}
