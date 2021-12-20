package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Vehiculo;
import java.util.List;

public interface DtoVehiculos {

	public List<Vehiculo> listarVehiculos();
	public void guardar (Vehiculo vehiculo);
	public void eliminar (Vehiculo vehiculo);
	public Vehiculo encontrarVehiculo(Vehiculo vehiculo);
	public Vehiculo encontrarVehiculo(int id);
}
