package com.gigeroa.vtv.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.gigeroa.vtv.dto.DtoInspeccion_y_Vehiculo;
import com.gigeroa.vtv.dto.DtoInspeccionesImpl;
import com.gigeroa.vtv.services.ControllersService;
import com.gigeroa.vtv.services.EstadosService;
import com.gigeroa.vtv.entities.EnumListaEstados;
import com.gigeroa.vtv.entities.Estado;
import com.gigeroa.vtv.entities.Medicion;
import com.gigeroa.vtv.entities.Observacion;

@Controller
public class InspeccionesController {
	
	@Autowired
	DtoInspeccionesImpl dtoInspecciones;

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
		ControllersService.setTitulo(model, "Agregar inspeccion");
		model.addAttribute("listaEstados", EnumListaEstados.CONDICIONAL);
		return "inspecciones/agregarInspeccion";
	}

	@GetMapping("/agregarInspeccion/agregar")
	public String agregarInspeccionesPost (Model model,
			@RequestParam int suspension,
			@RequestParam int direccion,
			@RequestParam int frenos,
			@RequestParam int contaminacion,
			@RequestParam int luces,
			@RequestParam int patente,
			@RequestParam int espejos,
			@RequestParam int chasis,
			@RequestParam int vidrios,
			@RequestParam int seguridad,
			@RequestParam int emergencia) {
		ControllersService.setTitulo(model, "Agregar inspeccion");
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
