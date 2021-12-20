package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.repositories.*;

public class Propietario implements IPersona{
	private Dni dni;
	private String nombre;
	private String apellido;
	private boolean exento;
	
//	Constructores
	public Propietario() throws DniInvalido {
		setDni(sinDni);
		this.nombre = sinNombre;
		this.apellido = sinApellido;
		this.exento = false;
	}
	
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
	@Override
	public String getNombre() {
		return nombre;
	}

	@Override
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
	
	@Override
	public Dni getDni() {
		return dni;
	}
	
	@Override
	public void setDni(String dni) throws DniInvalido {
		this.dni = new Dni(dni);
	}

	@Override
	public String toString() {
		return nombre + " - Dni: "+ getDni();
	}

	@Override
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	@Override
	public String getApellido() {
		return apellido;
	}

}
