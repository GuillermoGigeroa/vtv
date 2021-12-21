package com.gigeroa.vtv.repositories;

import java.util.List;
import com.gigeroa.vtv.entities.MarcaVehiculo;

public interface DtoMarcas {
	List<MarcaVehiculo> listar();
	void guardar (MarcaVehiculo usuario);
	void eliminar (MarcaVehiculo usuario);
	MarcaVehiculo buscar(MarcaVehiculo usuario);
	MarcaVehiculo buscar(int IDMarca);
}
