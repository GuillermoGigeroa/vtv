package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.repositories.*;

public class Inspector implements IPersona {
	private Dni dni;
	private String nombre;
	
//	Constructores
	public Inspector(String dni, String nombre) throws DniInvalido {
		setDni(dni);
		this.nombre = nombre;
	}

	public Inspector(int dni, String nombre) throws DniInvalido {
		this.dni = new Dni(dni);
		this.nombre = nombre;
	}
	
//	Métodos
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Override
	public void setDni(String dni) throws DniInvalido {
		this.dni = new Dni(dni);
	}

	@Override
	public Dni getDni() {
		return dni;
	}
	
	@Override
	public String toString() {
		return nombre + " - Dni:" + getDni();
	}
}
