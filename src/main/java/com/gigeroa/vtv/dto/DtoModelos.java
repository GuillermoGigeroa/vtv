package com.gigeroa.vtv.dto;

import java.util.List;
import com.gigeroa.vtv.entities.ModeloVehiculo;

public interface DtoModelos {
	public List<ModeloVehiculo> listarModelos();
	public void guardar (ModeloVehiculo usuario);
	public void eliminar (ModeloVehiculo usuario);
	public ModeloVehiculo encontrarModelo(ModeloVehiculo usuario);
	public ModeloVehiculo encontrarModelo(int IDModelo);
}