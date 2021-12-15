package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.repositories.*;

public class Propietario implements IPersona{
	private Dni dni;
	private String nombre;
	private boolean exento;
	
//	Constructores
	public Propietario(String dni, String nombre, boolean exento) throws DniInvalido {
		setDni(dni);
		this.nombre = nombre;
		this.exento = exento;
	}

	public Propietario(int dni, String nombre, boolean exento) throws DniInvalido {
		this.dni = new Dni(dni);
		this.nombre = nombre;
		this.exento = exento;
	}

//	Métodos
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public boolean isExento() {
		return exento;
	}

	public String esExento() {
		return exento ? "Si" : "No";
	}

	public void setExento(boolean exento) {
		this.exento = exento;
	}
	
	public Dni getDni() {
		return dni;
	}
	
	public void setDni(String dni) throws DniInvalido {
		this.dni = new Dni(dni);
	}

	@Override
	public String toString() {
		return nombre + " - Dni: "+ getDni();
	}

}
