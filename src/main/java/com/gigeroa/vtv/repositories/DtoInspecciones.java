package com.gigeroa.vtv.repositories;

import java.util.ArrayList;
import java.util.List;
import com.gigeroa.vtv.entities.Inspeccion;

public interface DtoInspecciones {
	List<Inspeccion> listarInspecciones();
	void guardar (Inspeccion inspeccion);
	void eliminar (Inspeccion inspeccion);
	Inspeccion encontrarInspeccion(Inspeccion inspeccion);
	ArrayList<Inspeccion> listarInspeccionesPorFecha(String fecha);
	ArrayList<Inspeccion> listarInspeccionesPorPropietario(int dni);
}