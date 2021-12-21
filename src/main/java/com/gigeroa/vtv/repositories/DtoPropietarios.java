package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Propietario;
import java.util.List;

public interface DtoPropietarios {

	List<Propietario> listarPropietarios();
	void guardar (Propietario propietario);
	void eliminar (Propietario propietario);
	Propietario encontrarPropietario(Propietario propietario);
	Propietario encontrarPropietario(int dni);
	Propietario buscarPorVehiculo(int id);
}