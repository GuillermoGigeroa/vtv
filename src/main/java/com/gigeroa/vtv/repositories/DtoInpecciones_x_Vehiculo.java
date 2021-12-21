package com.gigeroa.vtv.repositories;

import java.util.List;
import com.gigeroa.vtv.entities.Inspecciones_x_Vehiculo;

public interface DtoInpecciones_x_Vehiculo {
	List<Inspecciones_x_Vehiculo> listar();
	void guardar (Inspecciones_x_Vehiculo ixv);
	void eliminar (Inspecciones_x_Vehiculo ixv);
	Inspecciones_x_Vehiculo encontrar(Inspecciones_x_Vehiculo ixv);
	Inspecciones_x_Vehiculo encontrar(int idInspeccion);
}
