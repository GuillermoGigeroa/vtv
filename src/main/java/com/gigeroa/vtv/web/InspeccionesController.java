package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.gigeroa.vtv.dto.DtoInspeccion_y_Vehiculo;
import com.gigeroa.vtv.dto.DtoInspeccionesImpl;
import com.gigeroa.vtv.dto.DtoVehiculosImpl;
import com.gigeroa.vtv.services.ControllersService;
import com.gigeroa.vtv.services.EstadosService;
import com.gigeroa.vtv.entities.EnumListaEstados;
import com.gigeroa.vtv.entities.Estado;
import com.gigeroa.vtv.entities.Medicion;
import com.gigeroa.vtv.entities.Observacion;
import com.gigeroa.vtv.entities.Vehiculo;

@Controller
public class InspeccionesController {
	
	@Autowired
	DtoInspeccionesImpl dtoInspecciones;

	@Autowired
	DtoVehiculosImpl dtoVehiculos;

	@Autowired
	DtoInspeccion_y_Vehiculo dtoIyV;
	
	@GetMapping ("/listarInspecciones")
	public String listarInspecciones (Model model) {
		ControllersService.setTitulo(model, "Lista de inspecciones");
//		Se trae lista de objeto que contiene inspeccion y vehiculo
		model.addAttribute("listaInspecciones",dtoIyV.listar());
		return "inspecciones/listarInspecciones";
	}
	
	@GetMapping("/agregarInspeccion")
	public String agregarInspecciones (Model model) {
		return "redirect:/listarVehiculos/1";
	}

	@GetMapping("/agregarInspeccion/{idVehiculo}")
	public String agregarInspecciones (Model model, @PathVariable int idVehiculo) {
		Vehiculo vehiculo = dtoVehiculos.buscar(idVehiculo);
		model.addAttribute("vehiculoActual", vehiculo);
		ControllersService.setTitulo(model, "Agregar inspeccion - " + vehiculo.getMatricula());

		model.addAttribute("idVehiculo", idVehiculo);
		model.addAttribute("listaEstados", EnumListaEstados.CONDICIONAL);
		return "inspecciones/agregarInspeccion";
	}

	@PostMapping("/agregarInspeccion/agregar")
	public String agregarInspeccionesPost (Model model,
			@RequestParam (required = true) Integer idVehiculo,
			@RequestParam (required = false) Integer suspension,
			@RequestParam (required = false) Integer direccion,
			@RequestParam (required = false) Integer frenos,
			@RequestParam (required = false) Integer contaminacion,
			@RequestParam (required = false) Integer luces,
			@RequestParam (required = false) Integer patente,
			@RequestParam (required = false) Integer espejos,
			@RequestParam (required = false) Integer chasis,
			@RequestParam (required = false) Integer vidrios,
			@RequestParam (required = false) Integer seguridad,
			@RequestParam (required = false) Integer emergencia) {
		ControllersService.setTitulo(model, "Agregar inspeccion - "+dtoVehiculos.buscar(idVehiculo).getMatricula());
		model.addAttribute("idVehiculo",idVehiculo);
		Integer [] lista = {suspension,direccion,frenos,contaminacion,luces,patente,espejos,chasis,vidrios,seguridad,emergencia};
		for (Integer i : lista) {
			if (i == null) {
				return "redirect:/errorURL";
			}
		}
		EnumListaEstados resultado = EnumListaEstados.RECHAZADO;
		resultado.setSuspension(suspension);
		resultado.setDireccion(direccion);
		resultado.setFrenos(frenos);
		resultado.setContaminacion(contaminacion);
		resultado.setLuces(luces);
		resultado.setPatente(patente);
		resultado.setEspejos(espejos);
		resultado.setChasis(chasis);
		resultado.setVidrios(vidrios);
		resultado.setSeguridad(seguridad);
		resultado.setEmergencia(emergencia);
		Medicion medicion = new Medicion(
				new Estado(suspension),
				new Estado(direccion),
				new Estado(frenos),
				new Estado(contaminacion));
		Observacion observacion = new Observacion(
				new Estado(luces),
				new Estado(patente),
				new Estado(espejos),
				new Estado(chasis),
				new Estado(vidrios),
				new Estado(seguridad),
				new Estado(emergencia));
		Estado estado = new Estado(EstadosService.getEstado(observacion, medicion));
		model.addAttribute("listaEstados", resultado);
		model.addAttribute("estado",estado);
		return "inspecciones/agregarInspeccion";
	}
}
