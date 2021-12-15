package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Dni;
import com.gigeroa.vtv.exceptions.DniInvalido;

public interface IPersona {
	String sinNombre = "Sin nombre";
	void setNombre(String nombre);
	String getNombre();
	void setDni(String dni) throws DniInvalido;
	Dni getDni();
	//TODO se debe separar nombre y apellido, lo mismo en BBDD. Tiene que estar reflejado en Inspector y Propietario
}
