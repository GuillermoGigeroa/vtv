package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.gigeroa.vtv.dto.*;
import com.gigeroa.vtv.entities.*;
import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.repositories.IModelo_Marca;
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
	
	@RequestMapping(value = {"/listarVehiculos"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String listarVehiculos (Model model) {
		ControllersService.setTitulo(model, "Lista de vehículos");
//		Se trae lista de vehiculos
		model.addAttribute("listaVehiculos", dtoPyV.listar());
		return listarVehiculos;
	}

	@RequestMapping(value = {"/listarVehiculos/{agregar}"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String listarVehiculos2 (Model model, @PathVariable (required = false) Integer agregar) {
		if (agregar == null) {
			return "redirect:/listarVehiculos";
		}
		ControllersService.setTitulo(model, "Lista de vehículos");
		
//		Si un valor numérico entra por pathvariable entonces aparece el mensaje
		model.addAttribute("mensaje", "Para agregar una inspección debe presionar este botón en el vehiculo");
		
//		Se trae lista de vehiculos
		model.addAttribute("listaVehiculos", dtoPyV.listar());
		
		return listarVehiculos;
	}

	@RequestMapping(value = {"/agregarVehiculo", "/agregarVehiculo/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String agregarVehiculo (Model model, MarcaVehiculo marcaVehiculo) {
		ControllersService.setTitulo(model, "Agregar vehículo");
		listarMarcas(model);
		return agregarVehiculo;
	}

//	Mapeo de la sección /seleccionMarca para continuar con la selección de la marca
	@RequestMapping(value = {"/seleccionMarca", "/seleccionMarca/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String seleccionMarca (Model model,
			MarcaVehiculo marcaVehiculo,
			ModeloVehiculo modeloVehiculo) {
		if (marcaVehiculo.getIdMarca() == IModelo_Marca.idDefault) {
			return "redirect:/agregarVehiculo";
		}
		ControllersService.setTitulo(model, "Agregar vehículo");
		listarMarcas(model);
		listarModelos(model, marcaVehiculo.getIdMarca());
		marcaSelecionada(model, marcaVehiculo.getIdMarca());
		return agregarVehiculo;
	}
	
//	Mapeo de la sección /seleccionModelo para continuar con la selección del modelo
	@RequestMapping(value = {"/seleccionModelo", "/seleccionModelo/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String seleccion (Model model,
			MarcaVehiculo marcaVehiculo,
			ModeloVehiculo modeloVehiculo) throws DniInvalido {
		if (marcaVehiculo.getIdMarca() == IModelo_Marca.idDefault | modeloVehiculo.getIdModelo() == IModelo_Marca.idDefault) {
			return "redirect:/agregarVehiculo";
		}
		ControllersService.setTitulo(model, "Agregar vehículo");
		listarMarcas(model);
		listarModelos(model, marcaVehiculo.getIdMarca());
		listarPropietarios(model);
		model.addAttribute("propietarioSeleccionado",new Propietario());
		marcaSelecionada(model, marcaVehiculo.getIdMarca());
		modeloSeleccionado(model, marcaVehiculo.getIdMarca(), modeloVehiculo.getIdModelo());
		return agregarVehiculo;
	}
	
//	Mapeo de la sección /seleccionPropietario para continuar con la selección del propietario
	@RequestMapping(value = {"/seleccionPropietario", "/seleccionPropietario/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String seleccionPropietario (Model model,
			ModeloVehiculo modeloVehiculo,
			MarcaVehiculo marcaVehiculo,
			@RequestParam (required = false) String nombre) {
		if (modeloVehiculo.getIdModelo() == IModelo_Marca.idDefault | marcaVehiculo.getIdMarca() == IModelo_Marca.idDefault | nombre == null) {
			return "redirect:/agregarVehiculo";
		}
		ControllersService.setTitulo(model, "Agregar vehículo");
		listarMarcas(model);
		listarModelos(model, marcaVehiculo.getIdMarca());
		listarPropietarios(model);
		marcaSelecionada(model, marcaVehiculo.getIdMarca());
		modeloSeleccionado(model, marcaVehiculo.getIdMarca(), modeloVehiculo.getIdModelo());
		propietarioSeleccionado(model, nombre);
		return agregarVehiculo;
	}
	
	@RequestMapping(value = {"/editarVehiculo", "/editarVehiculo/{idVehiculo}"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String editar (Model model, @PathVariable (required = false) Integer idVehiculo) {
		if (idVehiculo == null) {
			return "redirect:/listarVehiculos";
		}
		ControllersService.setTitulo(model,"En desarrollo - ID Vehiculo: "+idVehiculo);
		return "home/index";
	}

	@RequestMapping(value = {"/eliminarVehiculo", "/eliminarVehiculo/{idVehiculo}"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String eliminar (Model model, @PathVariable (required = false) Integer idVehiculo) {
		if (idVehiculo == null) {
			return "redirect:/listarVehiculos";
		}
		ControllersService.setTitulo(model,"En desarrollo - ID Vehiculo: "+idVehiculo);
		return "home/index";
	}
	
	private void listarPropietarios(Model model) {
		model.addAttribute("listaPropietarios",dtoPropietarios.listar());
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

	private void listarModelos(Model model, int idMarca) {
		model.addAttribute("listaModelos", dtoModelos.listarModelosPorMarca(idMarca));
	}
}
