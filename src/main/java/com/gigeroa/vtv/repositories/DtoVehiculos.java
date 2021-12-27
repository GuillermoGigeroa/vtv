package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Vehiculo;
import java.util.List;

public interface DtoVehiculos {

	List<Vehiculo> listar();
	void guardar (Vehiculo vehiculo);
	void eliminar (Vehiculo vehiculo);
	void eliminar(Integer idVehiculo);
	Vehiculo buscar(Vehiculo vehiculo);
	Vehiculo buscar(int id);
	Vehiculo buscarPorPropietario(int dni);
	Vehiculo buscarPorInspeccion(int inspeccion);
}
