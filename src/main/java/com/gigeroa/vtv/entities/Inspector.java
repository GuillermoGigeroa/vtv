package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.repositories.*;

public class Inspector implements IPersona, IContieneID {
	private int id;
	private String nombre;

//	Constructores
	public Inspector() {
		id = -1;
		this.nombre = sinNombre;
	}
	
	public Inspector(String nombre) {
		id = -1;
		this.nombre = nombre;
	}

	public Inspector(int id, String nombre) {
		this.id = id;
		this.nombre = nombre;
	}
	
//	Métodos
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
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

}
