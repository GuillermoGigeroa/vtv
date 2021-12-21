package com.gigeroa.vtv.repositories;

import java.util.List;
import com.gigeroa.vtv.entities.Vehiculos_x_Propietario;

public interface DtoVehiculos_x_Propietario {
	List<Vehiculos_x_Propietario> listar();
	void guardar (Vehiculos_x_Propietario vxp);
	void eliminar (Vehiculos_x_Propietario vxp);
	Vehiculos_x_Propietario buscar(Vehiculos_x_Propietario vxp);
	Vehiculos_x_Propietario buscar(int dniPropietario);
}
