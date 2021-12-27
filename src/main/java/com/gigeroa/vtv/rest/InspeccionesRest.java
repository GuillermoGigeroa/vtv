package com.gigeroa.vtv.rest;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@GetMapping
	public List<Inspeccion_y_Vehiculo> listar (){
		return dtoIyV.listar();
	}

	@GetMapping (value = {"/{idInspeccion}"})
	public Inspeccion_y_Vehiculo buscar (@PathVariable Integer idInspeccion){
		return dtoIyV.buscar(idInspeccion);
	}
	
	@PostMapping
	public void agregar(@RequestBody Inspeccion_y_Vehiculo iyv) {
		dtoInspecciones.guardar(iyv.getInspeccion(), iyv.getVehiculo().getID());
	}
	
	@PutMapping
	public void modificar(@RequestBody Inspeccion_y_Vehiculo iyv) {
		dtoInspecciones.guardar(iyv.getInspeccion(), iyv.getVehiculo().getID());
	}

	@DeleteMapping ("/{idInspeccion}")
	public void eliminar(@PathVariable Integer idInspeccion) {
		dtoInspecciones.eliminar(idInspeccion);
	}
}
