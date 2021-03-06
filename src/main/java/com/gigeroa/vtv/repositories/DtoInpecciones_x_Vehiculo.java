package com.gigeroa.vtv.repositories;

import java.util.ArrayList;
import java.util.List;
import com.gigeroa.vtv.entities.Inspecciones_x_Vehiculo;

public interface DtoInpecciones_x_Vehiculo {
	List<Inspecciones_x_Vehiculo> listar();
	void guardar (Inspecciones_x_Vehiculo ixv);
	void eliminar (Inspecciones_x_Vehiculo ixv);
	ArrayList<Inspecciones_x_Vehiculo> buscar(Inspecciones_x_Vehiculo ixv);
	ArrayList<Inspecciones_x_Vehiculo> buscar(int idVehiculo);
}
