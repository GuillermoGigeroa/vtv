package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Vehiculo;
import java.util.List;

public interface DtoVehiculos {

	List<Vehiculo> listarVehiculos();
	void guardar (Vehiculo vehiculo);
	void eliminar (Vehiculo vehiculo);
	Vehiculo encontrarVehiculo(Vehiculo vehiculo);
	Vehiculo encontrarVehiculo(int id);
	Vehiculo buscarPorPropietario(int dni);
}
