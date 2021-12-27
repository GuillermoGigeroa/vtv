package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Propietario;
import java.util.List;

public interface DtoPropietarios {

	List<Propietario> listar();
	void guardar (Propietario propietario);
	void eliminar (Propietario propietario);
	void eliminar(Integer dni);
	Propietario buscar(Propietario propietario);
	Propietario buscar(int dni);
	Propietario buscarPorVehiculo(int id);
}
