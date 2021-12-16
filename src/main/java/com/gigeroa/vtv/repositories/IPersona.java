package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.entities.Dni;
import com.gigeroa.vtv.exceptions.DniInvalido;

public interface IPersona {
	String sinNombre = "Sin nombre";
	String sinApellido = "Sin apellido";
	void setNombre(String nombre);
	String getNombre();
	void setApellido(String apellido);
	String getApellido();
	void setDni(String dni) throws DniInvalido;
	Dni getDni();
}
