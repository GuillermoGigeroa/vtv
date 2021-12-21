package com.gigeroa.vtv.repositories;

import java.util.List;
import com.gigeroa.vtv.entities.ModeloVehiculo;

public interface DtoModelos {
	List<ModeloVehiculo> listar();
	void guardar (ModeloVehiculo usuario);
	void eliminar (ModeloVehiculo usuario);
	ModeloVehiculo buscar(ModeloVehiculo usuario);
	ModeloVehiculo buscar(int IDModelo);
}