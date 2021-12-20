package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.MarcaVehiculo;
import com.gigeroa.vtv.entities.ModeloVehiculo;

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

	@GetMapping ("/index")
	public String index (Model model) {
		return inicioGet(model);
	}

//	Mapeo de la sección /seleccionMarca para continuar con la selección de la marca
	@GetMapping ("/seleccionMarca")
	public String seleccionMarca (Model model, @RequestParam int ID) {
		titulo(model);
		listarMarcas(model);
		listarModelos(model, ID);
		marcaSelecionada(model, ID);
		modeloNuevo(model);
		return "home/index";
	}

//	Mapeo de la sección /seleccionModelo para continuar con la selección del modelo
	@GetMapping ("/seleccionModelo")
	public String seleccion (Model model, @RequestParam int ID, @RequestParam int idMarca) {
		titulo(model);
		listarMarcas(model);
		listarModelos(model, idMarca);
		marcaSelecionada(model, idMarca);
		if (modeloSeleccionado(model, idMarca, ID)) {
			return "home/index";
		}
		else {
			return "redirect:/errorID";
		}
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
	
	public void titulo(Model model) {
		model.addAttribute("titulo", tituloIndex);
	}

	public void listarMarcas(Model model) {
		model.addAttribute("listaMarcas",(new DtoVehiculos()).listarMarcas());
	}

	public void listarModelos(Model model, int IDMarca) {
		model.addAttribute("listaModelos",(new DtoVehiculos()).listarModelos(IDMarca));
	}
}
