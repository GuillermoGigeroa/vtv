package com.gigeroa.vtv.repositories;

import java.util.List;
import com.gigeroa.vtv.entities.Modelos_x_Marca;

public interface DtoModelos_x_Marca {
	List<Modelos_x_Marca> listar();
	void guardar (Modelos_x_Marca mxm);
	void eliminar (Modelos_x_Marca mxm);
	Modelos_x_Marca encontrar(Modelos_x_Marca mxm);
	Modelos_x_Marca encontrar(int idMarca);
}
