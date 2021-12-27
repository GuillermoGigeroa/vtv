package com.gigeroa.vtv.dto;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.entities.Inspeccion_y_Vehiculo;
import com.gigeroa.vtv.entities.Inspecciones_x_Vehiculo;

@Service
public class DtoInspeccion_y_Vehiculo {
	@Autowired
	DtoInspecciones_x_VehiculoImpl dtoIXV;
	
	@Autowired
	DtoVehiculosImpl dtoVehiculos;
	
	@Autowired
	DtoInspeccionesImpl dtoInspecciones;
	
	@Transactional (readOnly = true)
	public ArrayList<Inspeccion_y_Vehiculo> listar(){
		ArrayList<Inspeccion_y_Vehiculo> lista = new ArrayList<Inspeccion_y_Vehiculo>();
		for (Inspecciones_x_Vehiculo ixv : dtoIXV.listar()) {
			lista.add(new Inspeccion_y_Vehiculo(
					dtoInspecciones.buscar(ixv.getIdInspeccion()),
					dtoVehiculos.buscar(ixv.getIdVehiculo())));
		}
		return lista;
	}
	
	@Transactional (readOnly = true)
	public Inspeccion_y_Vehiculo buscar(Integer idInspeccion){
		for (Inspecciones_x_Vehiculo ixv : dtoIXV.listar()) {
			if (ixv.getIdInspeccion() == idInspeccion) {
				return new Inspeccion_y_Vehiculo(
						dtoInspecciones.buscar(ixv.getIdInspeccion()), 
						dtoVehiculos.buscar(ixv.getIdVehiculo()));
			}
		}
		return null;
	}
}
