package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Dni;

public interface IPersona {
	String sinNombre = "Sin nombre";
	void setNombre(String nombre);
	String getNombre();
	void setDni(Dni dni);
	Dni getDni();
}
