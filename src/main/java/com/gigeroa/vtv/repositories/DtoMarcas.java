package com.gigeroa.vtv.repositories;

import java.util.List;
import com.gigeroa.vtv.entities.MarcaVehiculo;

public interface DtoMarcas {
	public List<MarcaVehiculo> listarMarcas();
	public void guardar (MarcaVehiculo usuario);
	public void eliminar (MarcaVehiculo usuario);
	public MarcaVehiculo encontrarMarca(MarcaVehiculo usuario);
	public MarcaVehiculo encontrarMarca(int IDMarca);
}
