package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Inspector;
import java.util.List;

public interface DtoInspectores {

	List<Inspector> listar();
	void guardar (Inspector inspector);
	void eliminar (Inspector inspector);
	void eliminar(Integer legajo);
	Inspector buscar(Inspector inspector);
	Inspector buscar(int legajo);
	
}
