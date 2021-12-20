package com.gigeroa.vtv.web;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.gigeroa.vtv.dto.*;
import com.gigeroa.vtv.entities.*;
import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.services.MatriculasService;


@Controller
public class VehiculosController {
	private String titulo;
	private final String listarVehiculos = "vehiculos/listarVehiculos";
	private final String agregarVehiculo = "vehiculos/agregarVehiculo";
	
	@Autowired
	private DtoMarcasImpl dtoMarcas;

	@Autowired
	private DtoModelosImpl dtoModelos;
	
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
		
		return listarVehiculos;
	}
	
	@GetMapping("/agregarVehiculo")
	public String agregarVehiculo (Model model) {
		tituloAgregar(model);
		listarMarcas(model);
		marcaNueva(model);
		return agregarVehiculo;
	}
	
	@GetMapping("/seleccionMarca")
	public String marca (Model model) {
		return agregarVehiculo(model);
	}

	@GetMapping("/seleccionModelo")
	public String modelo (Model model) {
		return agregarVehiculo(model);
	}

	@GetMapping("/seleccionPropietario")
	public String propietario (Model model) {
		return agregarVehiculo(model);
	}

//	Mapeo de la sección /seleccionMarca para continuar con la selección de la marca
	@PostMapping ("/seleccionMarca")
	public String seleccionMarca (Model model, @RequestParam int ID) {
		tituloAgregar(model);
		listarMarcas(model);
		listarModelos(model, ID);
		marcaSelecionada(model, ID);
		modeloNuevo(model);
		return agregarVehiculo;
	}

//	Mapeo de la sección /seleccionModelo para continuar con la selección del modelo
	@PostMapping ("/seleccionModelo")
	public String seleccion (Model model, @RequestParam int ID, @RequestParam int idMarca) throws DniInvalido {
		tituloAgregar(model);
		listarMarcas(model);
		listarModelos(model, idMarca);
		listarPropietarios(model);
		propietarioNuevo(model);
		marcaSelecionada(model, idMarca);
		if (modeloSeleccionado(model, idMarca, ID)) {
			return agregarVehiculo;
		}
		else {
			return "redirect:/errorID";
		}
	}
	
//	Mapeo de la sección /seleccionPropietario para continuar con la selección del propietario
	@PostMapping ("/seleccionPropietario")
	public String seleccionPropietario (Model model, @RequestParam int idModelo, @RequestParam int idMarca, @RequestParam String nombre) {
		tituloAgregar(model);
		listarMarcas(model);
		listarModelos(model, idMarca);
		marcaSelecionada(model, idMarca);
		modeloSeleccionado(model, idMarca, idModelo);
		listarPropietarios(model);
		try {
			propietarioSeleccionado(model, Integer.parseInt(nombre));
		}
		catch (NumberFormatException e){
			return "redirect:/errorDni";
		}
		return agregarVehiculo;
	}
	
	private void listarPropietarios(Model model) {
		model.addAttribute("listaPropietarios",(new DtoPropietarios()).listarPropietarios());
	}
	
	private void propietarioNuevo (Model model) throws DniInvalido {
		model.addAttribute("propietarioSeleccionado",new Propietario());
	}

	private boolean propietarioSeleccionado (Model model, int dni) {
		for (Propietario p : (new DtoPropietarios()).listarPropietarios()) {
			if (p.getDni().getNumero() == dni) {
				model.addAttribute("propietarioSeleccionado",p);
				return true;
			}
		}
		return false;
	}
	
	private void marcaNueva(Model model) {
		model.addAttribute("marcaVehiculo",new MarcaVehiculo());
	}

	private void modeloNuevo(Model model) {
		model.addAttribute("modeloVehiculo",new ModeloVehiculo());
	}

	private boolean modeloSeleccionado(Model model,int IDMarca, int ID) {
		for (ModeloVehiculo modelo : dtoModelos.listarModelosPorMarca(IDMarca)) {
			if (modelo.getID() == ID) {
				model.addAttribute("modeloVehiculo",modelo);
				return true;
			}
		}
		return false;
	}

	private void marcaSelecionada(Model model, int ID) {
		model.addAttribute("marcaVehiculo",dtoMarcas.encontrarMarca(ID));
	}
	
	private void tituloAgregar(Model model) {
		model.addAttribute("titulo", "Agregar vehículo");
	}

	private void listarMarcas(Model model) {
		model.addAttribute("listaMarcas",dtoMarcas.listarMarcas());
	}

	private void listarModelos(Model model, int IDMarca) {
		model.addAttribute("listaModelos",dtoModelos.listarModelosPorMarca(IDMarca));
	}
}
