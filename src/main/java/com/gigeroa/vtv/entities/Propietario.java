package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.repositories.*;

public class Propietario implements IPersona, IContieneID{
	private int id;
	private String nombre;
	private boolean exento;
	
//	Constructores
	public Propietario() {
		this.id = -1;
		this.nombre = sinNombre;
		this.exento = false;
	}
	
	public Propietario(String nombre, boolean exento) {
		this.id = -1;
		this.nombre = nombre;
		this.exento = exento;
	}

	public Propietario(int id, String nombre, boolean exento) {
		this.id = id;
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

	public void setExento(boolean exento) {
		this.exento = exento;
	}
	
	public int getID() {
		return id;
	}
	
	public void setID(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return nombre;
	}

	@Override
	public void setDni(Dni dni) {
		// TODO Implementar DNI dentro de la clase.		
	}

	@Override
	public Dni getDni() {
		// TODO Implementar DNI dentro de la clase.
		return null;
	}

}
