package com.gigeroa.vtv.repositories;

import java.util.List;
import com.gigeroa.vtv.entities.ModeloVehiculo;

public interface DtoModelos {
	List<ModeloVehiculo> listarModelos();
	void guardar (ModeloVehiculo usuario);
	void eliminar (ModeloVehiculo usuario);
	ModeloVehiculo encontrarModelo(ModeloVehiculo usuario);
	ModeloVehiculo encontrarModelo(int IDModelo);
}