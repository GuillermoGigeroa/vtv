package com.gigeroa.vtv.entities;

import java.util.Objects;
import javax.persistence.*;

@Entity
@Table (name = "vehiculos_x_propietario")
public class Vehiculos_x_Propietario {
	@Id
	@Column (name = "dni_propietario")
	int dni_propietario;

	@Column (name = "id_vehiculo")
	int id_vehiculo;

	public Vehiculos_x_Propietario() {
		dni_propietario = -1;
		id_vehiculo = -1;
	}

//	Constructores
	public Vehiculos_x_Propietario(int dni_propietario, int id_vehiculo) {
		super();
		this.dni_propietario = dni_propietario;
		this.id_vehiculo = id_vehiculo;
	}

//	Métodos
	public int getDni_propietario() {
		return dni_propietario;
	}

	public void setDni_propietario(int dni_propietario) {
		this.dni_propietario = dni_propietario;
	}

	public int getId_vehiculo() {
		return id_vehiculo;
	}

	public void setId_vehiculo(int id_vehiculo) {
		this.id_vehiculo = id_vehiculo;
	}

	@Override
	public int hashCode() {
		return Objects.hash(dni_propietario, id_vehiculo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Vehiculos_x_Propietario other = (Vehiculos_x_Propietario) obj;
		return dni_propietario == other.dni_propietario && id_vehiculo == other.id_vehiculo;
	}

	public String toString() {
		return "Vehiculos_x_Propietario [dni_propietario=" + dni_propietario + ", id_vehiculo=" + id_vehiculo + "]";
	}
	
}
