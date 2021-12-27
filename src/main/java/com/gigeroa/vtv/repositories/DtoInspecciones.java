package com.gigeroa.vtv.repositories;

import java.util.ArrayList;
import java.util.List;
import com.gigeroa.vtv.entities.Inspeccion;

public interface DtoInspecciones {
	List<Inspeccion> listar();
	void guardar(Inspeccion inspeccion, int idVehiculo);
	void eliminar (Inspeccion inspeccion);
	void eliminar(Integer idInspeccion);
	Inspeccion buscar(Inspeccion inspeccion);
	Inspeccion buscar(int numero);
	ArrayList<Inspeccion> listarPorFecha(String fecha);
	ArrayList<Inspeccion> listarPorPropietario(int dni);
}