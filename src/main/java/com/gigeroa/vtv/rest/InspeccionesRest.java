package com.gigeroa.vtv.rest;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.gigeroa.vtv.dto.DtoInspeccion_y_Vehiculo;
import com.gigeroa.vtv.dto.DtoInspeccionesImpl;
import com.gigeroa.vtv.entities.Inspeccion_y_Vehiculo;

@RestController
@RequestMapping ("/inspecciones")
public class InspeccionesRest {
	
	@Autowired
	DtoInspeccion_y_Vehiculo dtoIyV;

	@Autowired
	DtoInspeccionesImpl dtoInspecciones;
	
	@RequestMapping (method = {RequestMethod.GET})
	public List<Inspeccion_y_Vehiculo> listar (){
		return dtoIyV.listar();
	}

	@RequestMapping (value = {"/{idInspeccion}"}, method = {RequestMethod.GET})
	public Inspeccion_y_Vehiculo buscar (@PathVariable Integer idInspeccion){
		return dtoIyV.buscar(idInspeccion);
	}
	
	@RequestMapping (method = {RequestMethod.POST})
	public void agregar(@RequestBody Inspeccion_y_Vehiculo iyv) {
		dtoInspecciones.guardar(iyv.getInspeccion(), iyv.getVehiculo().getID());
	}
	
	@RequestMapping (method = {RequestMethod.PUT})
	public void modificar(@RequestBody Inspeccion_y_Vehiculo iyv) {
		dtoInspecciones.guardar(iyv.getInspeccion(), iyv.getVehiculo().getID());
	}

	@RequestMapping (value = {"/{idInspeccion}"}, method = {RequestMethod.DELETE})
	public void eliminar(@PathVariable Integer idInspeccion) {
		dtoInspecciones.eliminar(idInspeccion);
	}
}
