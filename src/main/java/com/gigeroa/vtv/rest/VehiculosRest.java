package com.gigeroa.vtv.rest;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.gigeroa.vtv.dto.DtoVehiculosImpl;
import com.gigeroa.vtv.entities.Vehiculo;

@RestController
@RequestMapping ("/vehiculos")
public class VehiculosRest {
	@Autowired
	DtoVehiculosImpl dtoVehiculos;
	
	@RequestMapping (method = {RequestMethod.GET})
	public List<Vehiculo> listar () {
		return dtoVehiculos.listar();
	}

	@RequestMapping (value = {"/{idVehiculo}"}, method = {RequestMethod.GET})
	public Vehiculo buscar (@PathVariable Integer idVehiculo) {
		return dtoVehiculos.buscar(idVehiculo);
	}

	@RequestMapping (method = {RequestMethod.POST})
	public void agregar (@RequestBody Vehiculo vehiculo) {
		dtoVehiculos.guardar(vehiculo);
	}

	@RequestMapping (method = {RequestMethod.PUT})
	public void modificar (@RequestBody Vehiculo vehiculo) {
		dtoVehiculos.guardar(vehiculo);
	}

	@RequestMapping (value = {"{idVehiculo}"}, method = {RequestMethod.DELETE})
	public void eliminar (@PathVariable Integer idVehiculo) {
		dtoVehiculos.eliminar(idVehiculo);
	}
}
