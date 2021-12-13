package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.exceptions.DniInvalido;

public interface IPersona {
	String sinNombre = "Sin nombre";
	void setNombre(String nombre);
	String getNombre();
	void setDni(String dni) throws DniInvalido;
	String getDni();
}
