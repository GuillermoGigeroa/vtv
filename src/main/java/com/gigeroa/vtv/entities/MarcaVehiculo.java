package com.gigeroa.vtv.entities;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.*;
import com.gigeroa.vtv.repositories.IModelo_Marca;

@Entity
@Table (name = "marcas")
public class MarcaVehiculo implements IModelo_Marca, Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (name = "id")
	private int idMarca;
	
	@Column (name = "nombre")
	private String nombre;
	
//	Constructores
	public MarcaVehiculo() {
		this.idMarca = idDefault;
		this.nombre = nombreDefault;
	}
	
	public MarcaVehiculo(int idMarca, String nombre) {
		this.idMarca = idMarca;
		this.nombre = nombre;
	}

	public int getIdMarca() {
		return idMarca;
	}

	public void setIdMarca(int id) {
		this.idMarca = id;
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
		return Objects.hash(idMarca, nombre);
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
		return idMarca == other.idMarca && Objects.equals(nombre, other.nombre);
	}
	
}
