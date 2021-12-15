package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.repositories.IContieneID;
import com.gigeroa.vtv.repositories.IModelo_Marca;

public class ModeloVehiculo implements IContieneID, IModelo_Marca{
	private int ID;
	private String nombre;
	
//	Constructor
	public ModeloVehiculo(int ID, String nombre) {
		this.ID = ID;
		this.nombre = nombre;
	}

//	Métodos
	@Override
	public int getID() {
		return ID;
	}

	@Override
	public void setID(int id) {
		this.ID = id;
	}

	@Override
	public String getNombre() {
		return nombre;
	}

	@Override
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Override
	public String toString() {
		return nombre;
	}
}
