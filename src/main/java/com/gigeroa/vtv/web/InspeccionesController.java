package com.gigeroa.vtv.web;

import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.gigeroa.vtv.dto.DtoInspeccion_y_Vehiculo;
import com.gigeroa.vtv.dto.DtoInspeccionesImpl;
import com.gigeroa.vtv.dto.DtoInspectoresImpl;
import com.gigeroa.vtv.dto.DtoPropietariosImpl;
import com.gigeroa.vtv.dto.DtoVehiculosImpl;
import com.gigeroa.vtv.services.ControllersService;
import com.gigeroa.vtv.services.EstadosService;
import com.gigeroa.vtv.entities.Estado;
import com.gigeroa.vtv.entities.Inspeccion;
import com.gigeroa.vtv.entities.Inspector;
import com.gigeroa.vtv.entities.ListaEstados;
import com.gigeroa.vtv.entities.Medicion;
import com.gigeroa.vtv.entities.Observacion;

@Controller
public class InspeccionesController {
	
	@Autowired
	DtoInspectoresImpl dtoInspectores;
	
	@Autowired
	DtoInspeccionesImpl dtoInspecciones;

	@Autowired
	DtoVehiculosImpl dtoVehiculos;

	@Autowired
	DtoPropietariosImpl dtoPropietarios;

	@Autowired
	DtoInspeccion_y_Vehiculo dtoIyV;
	
	@RequestMapping (value = {"/listarInspecciones", "/listarInspecciones/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String listarInspecciones (Model model) {
//		Se agrega un título
		ControllersService.setTitulo(model, "Lista de inspecciones");

//		Se trae lista de objeto que contiene inspeccion y vehiculo
		model.addAttribute("listaInspecciones",dtoIyV.listar());
		return "inspecciones/listarInspecciones";
	}
	
	@RequestMapping (value = {"/agregarInspeccion"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String agregarInspecciones (Model model) {
//		Se redirige al usuario a la lista de vehículos con un mensaje orientativo
		return "redirect:/listarVehiculos/1";
	}

	@RequestMapping (value = "/agregarInspeccion/{idVehiculo}", method = {RequestMethod.GET, RequestMethod.POST})
	public String agregarInspecciones (Model model,
			@PathVariable (required = false) Integer idVehiculo,
			ListaEstados listaEstados,
			Inspector inspectorActual) {
		if(idVehiculo == null) {
			return "redirect:/listarVehiculos/1";
		}
		
//		Se agrega título personalizado con la matrícula del vehículo
		ControllersService.setTitulo(model, "Agregar inspeccion - " + dtoVehiculos.buscar(idVehiculo).getMatricula());

//		Se vuelve a enviar el idVehiculo para poder seguir trabajando
		model.addAttribute("idVehiculo", idVehiculo);
		
//		Se agrega lista de inspectores para seleccionar
		model.addAttribute("listaInspectores",dtoInspectores.listar());

		return "inspecciones/agregarInspeccion";
	}
	
	@RequestMapping (value = {"/seleccionarInspector", "/seleccionarInspector/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String seleccionarInspector (Model model,
			@RequestParam (required = false) Integer legajo,
			@RequestParam (required = false) Integer idVehiculo,
			ListaEstados listaEstados) {
//		Se comprueba que los parámetros ingresados no sean nulos
		if (legajo == null | idVehiculo == null) {
			return "redirect:/index";
		}

//		Se agrega título personalizado con la matrícula del vehículo
		ControllersService.setTitulo(model, "Agregar inspeccion - " + dtoVehiculos.buscar(idVehiculo).getMatricula());
		
//		Se vuelve a enviar el idVehiculo para poder seguir trabajando
		model.addAttribute("idVehiculo", idVehiculo);
		
//		Se recibe un legajo de inspector por PathVariable para trabajar con el vehiculo
		model.addAttribute("inspectorActual",dtoInspectores.buscar(legajo));
		
		return "inspecciones/agregarInspeccion";
	}

	@RequestMapping (value = {"/agregarInspeccion/agregar", "/agregarInspeccion/agregar/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String agregarInspecciones (Model model,
			@RequestParam (required = false) Integer idVehiculo,
			@RequestParam (required = false) Integer legajo,
			ListaEstados listaEstados) {
//		Se personaliza el título con la matrícula del vehículo
		ControllersService.setTitulo(model, "Agregar inspeccion - "+dtoVehiculos.buscar(idVehiculo).getMatricula());
		
//		Se envía el inspector para seguir trabajando
		model.addAttribute("inspectorActual",dtoInspectores.buscar(legajo));
		
//		Se envia el vehículo para seguir trabajando
		model.addAttribute("vehiculo",dtoVehiculos.buscar(idVehiculo));

//		Se envía el propietario para seguir trabajando
		model.addAttribute("propietario",dtoPropietarios.buscarPorVehiculo(idVehiculo));

//		Se envía fecha actual
		model.addAttribute("fecha",LocalDate.now().toString());
		
//		Se genera un objeto medicion para continuar con el análisis de lo ingresado
		Medicion medicion = new Medicion(
				new Estado(listaEstados.getSuspension()),
				new Estado(listaEstados.getDireccion()),
				new Estado(listaEstados.getFrenos()),
				new Estado(listaEstados.getContaminacion()));
		
//		Se genera un objeto observación para continuar con el análisis de lo ingresado
		Observacion observacion = new Observacion(
				new Estado(listaEstados.getLuces()),
				new Estado(listaEstados.getPatente()),
				new Estado(listaEstados.getEspejos()),
				new Estado(listaEstados.getChasis()),
				new Estado(listaEstados.getVidrios()),
				new Estado(listaEstados.getSeguridad()),
				new Estado(listaEstados.getEmergencia()));
		
//		Se genera un objeto estado para procesar los datos ingresados
		Estado estado = new Estado(EstadosService.getEstado(observacion, medicion));

//		Se envía el estado, luego de ser procesado
		model.addAttribute("estado",estado);
		
		return "inspecciones/agregarInspeccion";
	}

	@RequestMapping (value = {"/guardarInspeccion", "/guardarInspeccion/"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String guardarInspeccion (
			Model model,
			@RequestParam (required = false) Integer idVehiculo,
			@RequestParam (required = false) Integer legajo,
			@RequestParam (required = false) String estado) {
		if (idVehiculo == null | legajo == null | estado == null) {
			return "redirect:/index";
		}
		
		ControllersService.setTitulo(model, "Guardar inspeccion - IDVehiculo: " + idVehiculo + " - Estado: " + estado + " - Legajo: "+legajo);
		
//		Se crea la inspección y se guarda en BBDD
		Inspeccion inspeccion = new Inspeccion(LocalDate.now(),dtoInspectores.buscar(legajo),dtoVehiculos.buscar(idVehiculo),EstadosService.estadoToNumero(estado));
		dtoInspecciones.guardar(inspeccion, idVehiculo);
		return "home/index";
	}
	
	
	@RequestMapping(value = {"/editarInspeccion", "/editarInspeccion/{idInspeccion}"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String editar (Model model, @PathVariable (required = false) Integer idInspeccion) {
		if (idInspeccion == null) {
			return "redirect:/listarInspecciones";
		}
		ControllersService.setTitulo(model,"En desarrollo - ID Inspeccion: "+idInspeccion);
		return "home/index";
	}

	@RequestMapping(value = {"/eliminarInspeccion", "/eliminarInspeccion/{idInspeccion}"}, method = {RequestMethod.GET, RequestMethod.POST})
	public String eliminar (Model model, @PathVariable (required = false) Integer idInspeccion) {
		if (idInspeccion == null) {
			return "redirect:/listarInspecciones";
		}
		ControllersService.setTitulo(model,"En desarrollo - ID Inspeccion: "+idInspeccion);
		return "home/index";
	}
}
