package com.gigeroa.vtv.dto;

import com.gigeroa.vtv.entities.Propietario;
import java.util.List;

public interface DtoPropietarios {

	public List<Propietario> listarPropietarios();
	public void guardar (Propietario propietario);
	public void eliminar (Propietario propietario);
	public Propietario encontrarPropietario(Propietario propietario);
	public Propietario encontrarPropietario(int dni);
}
