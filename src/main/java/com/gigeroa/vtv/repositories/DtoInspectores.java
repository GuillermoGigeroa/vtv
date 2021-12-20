package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Inspector;
import java.util.List;

public interface DtoInspectores {

	public List<Inspector> listarInspectores();
	public void guardar (Inspector inspector);
	public void eliminar (Inspector inspector);
	public Inspector encontrarInspector(Inspector inspector);
	public Inspector encontrarInspectorLegajo(int legajo);
	
}
