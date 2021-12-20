package com.gigeroa.vtv.entities;

import java.util.Objects;
import javax.persistence.*;
import com.gigeroa.vtv.repositories.IContieneID;
import com.gigeroa.vtv.repositories.IModelo_Marca;

@Entity
public class MarcaVehiculo implements IContieneID, IModelo_Marca {
	
	@Id
	@Column (name = "id")
	private int ID;
	
	@Column (name = "nombre")
	private String nombre;
	
//	Constructores
	public MarcaVehiculo() {
		this.ID = idDefault;
		this.nombre = nombreDefault;
	}
	
	public MarcaVehiculo(int ID, String nombre) {
		this.ID = ID;
		this.nombre = nombre;
	}

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

	@Override
	public int hashCode() {
		return Objects.hash(ID, nombre);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MarcaVehiculo other = (MarcaVehiculo) obj;
		return ID == other.ID && Objects.equals(nombre, other.nombre);
	}
	
}
