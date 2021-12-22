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
import com.gigeroa.vtv.entities.Inspeccion;
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
//		Se agrega un título
		ControllersService.setTitulo(model, "Lista de inspecciones");

//		Se trae lista de objeto que contiene inspeccion y vehiculo
		model.addAttribute("listaInspecciones",dtoIyV.listar());
		return "inspecciones/listarInspecciones";
	}
	
	@GetMapping("/agregarInspeccion")
	public String agregarInspecciones (Model model) {
//		Se redirige al usuario a la lista de vehículos con un mensaje orientativo
		return "redirect:/listarVehiculos/1";
	}

	@GetMapping("/agregarInspeccion/{idVehiculo}")
	public String agregarInspecciones (Model model, @PathVariable int idVehiculo) {
//		Se recibe un id de vehiculo por PathVariable para trabajar con el vehiculo
		Vehiculo vehiculo = dtoVehiculos.buscar(idVehiculo);
		model.addAttribute("vehiculoActual", vehiculo);

//		Se agrega título personalizado con la matrícula del vehículo
		ControllersService.setTitulo(model, "Agregar inspeccion - " + vehiculo.getMatricula());

//		Se vuelve a enviar el idVehiculo para poder seguir trabajando
		model.addAttribute("idVehiculo", idVehiculo);
		
//		Se envía un objeto del tipo EnumListaEstados para trabajar con los datos ingresados
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
//		Se reciben por parámetros en POST todos los valores para ser analizados
		
//		Se personaliza el título con la matrícula del vehículo
		ControllersService.setTitulo(model, "Agregar inspeccion - "+dtoVehiculos.buscar(idVehiculo).getMatricula());
		
//		Se vuelve a enviar el idVehiculo para seguir trabajando
		model.addAttribute("idVehiculo",idVehiculo);
		
//		Se comprueba que no se haya forzado el intento de modificación de algún parámetro
		Integer [] lista = {suspension,direccion,frenos,contaminacion,luces,patente,espejos,chasis,vidrios,seguridad,emergencia};
		for (Integer i : lista) {
			if (i == null) {
				return "redirect:/index";
			}
		}
		
//		Se cargan los datos en el EnumListaEstados para poder ser analizados
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
		
//		Se genera un objeto medicion para continuar con el análisis de lo ingresado
		Medicion medicion = new Medicion(
				new Estado(suspension),
				new Estado(direccion),
				new Estado(frenos),
				new Estado(contaminacion));
		
//		Se genera un objeto observación para continuar con el análisis de lo ingresado
		Observacion observacion = new Observacion(
				new Estado(luces),
				new Estado(patente),
				new Estado(espejos),
				new Estado(chasis),
				new Estado(vidrios),
				new Estado(seguridad),
				new Estado(emergencia));
		
//		Se genera un objeto estado para procesar los datos ingresados
		Estado estado = new Estado(EstadosService.getEstado(observacion, medicion));

//		Se envía nuevamente los datos ingresados para ser corroborados
		model.addAttribute("listaEstados", resultado);
		
//		Se envía el estado, luego de ser procesado
		model.addAttribute("estado",estado);
		
		return "inspecciones/agregarInspeccion";
	}

	@GetMapping("/guardarInspeccion")
	public String guardarInspeccion (
			Model model,
			@RequestParam (required = false) Integer idVehiculo,
			@RequestParam (required = false) String estado) {
		if (idVehiculo == null | estado == null) {
			return "redirect:/index";
		}
		
		//TODO generar inspeccion antes de enviar a guardar. Ver ID
		Inspeccion inspeccion = new Inspeccion();
		
//		Se envía dato de confirmación para mostrar mensaje en front
		model.addAttribute("guardar",true);
		return "redirect:/listarInspecciones";
	}
}
