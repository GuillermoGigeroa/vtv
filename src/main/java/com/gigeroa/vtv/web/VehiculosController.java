package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.gigeroa.vtv.dto.*;
import com.gigeroa.vtv.entities.*;
import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.services.ControllersService;

@Controller
public class VehiculosController {
	private final String listarVehiculos = "vehiculos/listarVehiculos";
	private final String agregarVehiculo = "vehiculos/agregarVehiculo";
	
	@Autowired
	private DtoPropietario_y_Vehiculo dtoPyV;
	
	@Autowired
	private DtoPropietariosImpl dtoPropietarios;

	@Autowired
	private DtoMarcasImpl dtoMarcas;

	@Autowired
	private DtoModelosImpl dtoModelos;
	
	@GetMapping("/listarVehiculos")
	public String listarVehiculos (Model model) {
		ControllersService.setTitulo(model, "Lista de vehículos");
//		Se trae lista de vehiculos
		model.addAttribute("listaVehiculos", dtoPyV.listar());
		return listarVehiculos;
	}
	
	@GetMapping("/agregarVehiculo")
	public String agregarVehiculo (Model model) {
		ControllersService.setTitulo(model, "Agregar vehículo");
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
		ControllersService.setTitulo(model, "Agregar vehículo");
		listarMarcas(model);
		listarModelos(model, ID);
		marcaSelecionada(model, ID);
		modeloNuevo(model);
		return agregarVehiculo;
	}

//	Mapeo de la sección /seleccionModelo para continuar con la selección del modelo
	@PostMapping ("/seleccionModelo")
	public String seleccion (Model model, @RequestParam int ID, @RequestParam int idMarca) throws DniInvalido {
		ControllersService.setTitulo(model, "Agregar vehículo");
		listarMarcas(model);
		listarModelos(model, idMarca);
		listarPropietarios(model);
		propietarioNuevo(model);
		if (!marcaSelecionada(model, idMarca)) {
			return "redirect:/errorURL";
		}
		if (!modeloSeleccionado(model, idMarca, ID)) {
			return "redirect:/errorURL";
		}
		return agregarVehiculo;
	}
	
//	Mapeo de la sección /seleccionPropietario para continuar con la selección del propietario
	@PostMapping ("/seleccionPropietario")
	public String seleccionPropietario (Model model, @RequestParam int idModelo, @RequestParam int idMarca, @RequestParam String nombre) {
		ControllersService.setTitulo(model, "Agregar vehículo");
		listarMarcas(model);
		listarModelos(model, idMarca);
		listarPropietarios(model);
		if (!marcaSelecionada(model, idMarca)) {
			return "redirect:/errorURL";
		}
		if (!modeloSeleccionado(model, idMarca, idModelo)) {
			return "redirect:/errorURL";
		}
		if (!propietarioSeleccionado(model, nombre)) {
			return "redirect:/errorURL";
		}
		return agregarVehiculo;
	}
	
	private void listarPropietarios(Model model) {
		model.addAttribute("listaPropietarios",dtoPropietarios.listar());
	}
	
	private void propietarioNuevo (Model model) throws DniInvalido {
		model.addAttribute("propietarioSeleccionado",new Propietario());
	}

	private boolean propietarioSeleccionado (Model model, String dniString) {
		int dni = 0;
		try {
			dni = (new Dni(dniString)).getNumero();
		}
		catch (DniInvalido e) {
			return false;
		}
		Propietario propietario = dtoPropietarios.buscar(dni);
		if (propietario != null) {
			model.addAttribute("propietarioSeleccionado",propietario);
			return true;
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
		ModeloVehiculo modelo = dtoModelos.buscar(ID);
		if (modelo != null) {
			model.addAttribute("modeloVehiculo",modelo);
			return true;
		}
		return false;
	}

	private boolean marcaSelecionada(Model model, int ID) {
		MarcaVehiculo marca = dtoMarcas.buscar(ID);
		if (marca != null) {
			model.addAttribute("marcaVehiculo",marca);
			return true;
		}
		return false;
	}
	
	private void listarMarcas(Model model) {
		model.addAttribute("listaMarcas", dtoMarcas.listar());
	}

	private void listarModelos(Model model, int IDMarca) {
		model.addAttribute("listaModelos", dtoModelos.listarModelosPorMarca(IDMarca));
	}
}
