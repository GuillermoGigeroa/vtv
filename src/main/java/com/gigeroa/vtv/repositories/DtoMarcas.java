package com.gigeroa.vtv.repositories;

import java.util.List;
import com.gigeroa.vtv.entities.MarcaVehiculo;

public interface DtoMarcas {
	List<MarcaVehiculo> listarMarcas();
	void guardar (MarcaVehiculo usuario);
	void eliminar (MarcaVehiculo usuario);
	MarcaVehiculo encontrarMarca(MarcaVehiculo usuario);
	MarcaVehiculo encontrarMarca(int IDMarca);
}
