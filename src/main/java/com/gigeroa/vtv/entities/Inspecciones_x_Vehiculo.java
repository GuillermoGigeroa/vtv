package com.gigeroa.vtv.entities;

import java.util.Objects;

import javax.persistence.*;

@Entity
@Table (name = "inspecciones_x_vehiculo")
public class Inspecciones_x_Vehiculo {
	@Column (name = "id_vehiculo")
	int idVehiculo;
	
	@Id
	@Column (name = "id_inspeccion")
	int idInspeccion;

//	Constructores
	public Inspecciones_x_Vehiculo() {
		idInspeccion = -1;
		idVehiculo = -1;
	}

	public Inspecciones_x_Vehiculo(int idInspeccion, int idVehiculo) {
		this.idInspeccion = idInspeccion;
		this.idVehiculo = idVehiculo;
	}
	
//	Métodos
	public int getIdInspeccion() {
		return idInspeccion;
	}

	public void setIdInspeccion(int idInspeccion) {
		this.idInspeccion = idInspeccion;
	}

	public int getIdVehiculo() {
		return idVehiculo;
	}

	public void setIdVehiculo(int idVehiculo) {
		this.idVehiculo = idVehiculo;
	}

	@Override
	public int hashCode() {
		return Objects.hash(idInspeccion, idVehiculo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Inspecciones_x_Vehiculo other = (Inspecciones_x_Vehiculo) obj;
		return idInspeccion == other.idInspeccion && idVehiculo == other.idVehiculo;
	}
	
}
