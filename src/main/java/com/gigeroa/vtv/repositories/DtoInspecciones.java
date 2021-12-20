package com.gigeroa.vtv.repositories;

import java.util.List;
import com.gigeroa.vtv.entities.Inspeccion;

public interface DtoInspecciones {
	List<Inspeccion> listarInspecciones();
	void guardar (Inspeccion inspeccion);
	void eliminar (Inspeccion inspeccion);
	Inspeccion encontrarInspeccion(Inspeccion inspeccion);
}