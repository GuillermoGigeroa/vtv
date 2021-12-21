package com.gigeroa.vtv.repositories;

import java.util.ArrayList;
import java.util.List;
import com.gigeroa.vtv.entities.ModeloVehiculo;

public interface DtoModelos {
	List<ModeloVehiculo> listar();
	void guardar (ModeloVehiculo usuario);
	void eliminar (ModeloVehiculo usuario);
	ModeloVehiculo buscar(ModeloVehiculo usuario);
	ModeloVehiculo buscar(int IDModelo);
	ArrayList<ModeloVehiculo> listarModelosPorMarca (int ID_Marca);
}