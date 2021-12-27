package com.gigeroa.vtv.rest;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.gigeroa.vtv.dto.DtoVehiculosImpl;
import com.gigeroa.vtv.entities.Vehiculo;

@RestController
@RequestMapping ("/vehiculos")
public class VehiculosRest {
	@Autowired
	DtoVehiculosImpl dtoVehiculos;
	
	@GetMapping
	public List<Vehiculo> listar () {
		return dtoVehiculos.listar();
	}

	@GetMapping ("/{idVehiculo}")
	public Vehiculo buscar (@PathVariable Integer idVehiculo) {
		return dtoVehiculos.buscar(idVehiculo);
	}
}
