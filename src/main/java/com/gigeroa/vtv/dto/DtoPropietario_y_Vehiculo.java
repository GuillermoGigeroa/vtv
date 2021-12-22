package com.gigeroa.vtv.dto;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gigeroa.vtv.entities.Propietario_y_Vehiculo;
import com.gigeroa.vtv.entities.Vehiculos_x_Propietario;

@Service
public class DtoPropietario_y_Vehiculo {
	@Autowired
	DtoVehiculosImpl dtoVehiculos;

	@Autowired
	DtoPropietariosImpl dtoPropietarios;
	
	@Autowired
	DtoVehiculos_x_PropietarioImpl dtoVXP;
	
	public ArrayList<Propietario_y_Vehiculo> listar(){
		ArrayList<Propietario_y_Vehiculo> lista = new ArrayList<Propietario_y_Vehiculo>();
		for (Vehiculos_x_Propietario vxp: dtoVXP.listar()) {
			lista.add(new Propietario_y_Vehiculo(
					dtoPropietarios.buscar(vxp.getDni_propietario()),
					dtoVehiculos.buscar(vxp.getId_vehiculo())));
		}
		return lista;
	}
}
