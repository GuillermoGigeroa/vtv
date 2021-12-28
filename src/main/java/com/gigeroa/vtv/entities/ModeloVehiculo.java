package com.gigeroa.vtv.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import com.gigeroa.vtv.repositories.IModelo_Marca;

@Entity
@Table (name = "modelos")
public class ModeloVehiculo implements IModelo_Marca{
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (name = "id")
	private int idModelo;
	
	@Column (name = "nombre")
	private String nombre;
	
//	Constructores
	public ModeloVehiculo() {
		this.idModelo = idDefault;
		this.nombre = nombreDefault;
	}
	
	public ModeloVehiculo(int ID, String nombre) {
		this.idModelo = ID;
		this.nombre = nombre;
	}

	public int getIdModelo() {
		return idModelo;
	}

	public void setIdModelo(int id) {
		this.idModelo = id;
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
		return Objects.hash(idModelo, nombre);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ModeloVehiculo other = (ModeloVehiculo) obj;
		return idModelo == other.idModelo && Objects.equals(nombre, other.nombre);
	}
}
