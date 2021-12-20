package com.gigeroa.vtv.web;

import java.util.ArrayList;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.gigeroa.vtv.dto.DtoPropietarios;
import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.MarcaVehiculo;
import com.gigeroa.vtv.entities.ModeloVehiculo;
import com.gigeroa.vtv.entities.Propietario;
import com.gigeroa.vtv.entities.Vehiculo;
import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.services.MatriculasService;

@Controller
public class VehiculosController {
	private String titulo;
	private final String listarVehiculos = "vehiculos/listarVehiculos";
	private final String agregarVehiculo = "vehiculos/agregarVehiculo";
	
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
	
//	Mapeo de la sección /seleccionMarca para continuar con la selección de la marca
	@GetMapping ("/seleccionMarca")
	public String seleccionMarca (Model model, @RequestParam int ID) {
		tituloAgregar(model);
		listarMarcas(model);
		listarModelos(model, ID);
		marcaSelecionada(model, ID);
		modeloNuevo(model);
		return agregarVehiculo;
	}

//	Mapeo de la sección /seleccionModelo para continuar con la selección del modelo
	@GetMapping ("/seleccionModelo")
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
	@GetMapping ("/seleccionPropietario")
	public String seleccionPropietario (Model model, @RequestParam int idModelo, @RequestParam int idMarca, @RequestParam String nombre) {
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
	
	public void listarPropietarios(Model model) {
		model.addAttribute("listaPropietarios",(new DtoPropietarios()).listarPropietarios());
	}
	
	public void propietarioNuevo (Model model) throws DniInvalido {
		model.addAttribute("propietarioSeleccionado",new Propietario());
	}

	public boolean propietarioSeleccionado (Model model, int dni) {
		for (Propietario p : (new DtoPropietarios()).listarPropietarios()) {
			if (p.getDni().getNumero() == dni) {
				model.addAttribute("propietarioSeleccionado",p);
				return true;
			}
		}
		return false;
	}
	
	public void marcaNueva(Model model) {
		model.addAttribute("marcaVehiculo",new MarcaVehiculo());
	}

	public void modeloNuevo(Model model) {
		model.addAttribute("modeloVehiculo",new ModeloVehiculo());
	}

	public boolean modeloSeleccionado(Model model,int IDMarca, int ID) {
		for (ModeloVehiculo modelo : (new DtoVehiculos()).listarModelos(IDMarca)) {
			if (modelo.getID() == ID) {
				model.addAttribute("modeloVehiculo",modelo);
				return true;
			}
		}
		return false;
	}

	public void marcaSelecionada(Model model, int ID) {
		model.addAttribute("marcaVehiculo",(new DtoVehiculos()).listarMarcas().get(ID-1));
	}
	
	public void tituloAgregar(Model model) {
		model.addAttribute("titulo", "Agregar vehículo");
	}

	public void listarMarcas(Model model) {
		model.addAttribute("listaMarcas",(new DtoVehiculos()).listarMarcas());
	}

	public void listarModelos(Model model, int IDMarca) {
		model.addAttribute("listaModelos",(new DtoVehiculos()).listarModelos(IDMarca));
	}
}
