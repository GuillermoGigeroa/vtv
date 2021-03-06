package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.exceptions.DniInvalido;

public interface IPersona {
	String sinDni = "00000000";
	String sinNombre = "Sin nombre";
	String sinApellido = "Sin apellido";
	void setNombre(String nombre);
	String getNombre();
	void setApellido(String apellido);
	String getApellido();
	void setDni(String dni) throws DniInvalido;
	int getDni();
}
