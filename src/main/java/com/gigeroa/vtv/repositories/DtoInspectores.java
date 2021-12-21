package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Inspector;
import java.util.List;

public interface DtoInspectores {

	List<Inspector> listarInspectores();
	void guardar (Inspector inspector);
	void eliminar (Inspector inspector);
	Inspector encontrarInspector(Inspector inspector);
	Inspector encontrarInspectorLegajo(int legajo);
	
}
