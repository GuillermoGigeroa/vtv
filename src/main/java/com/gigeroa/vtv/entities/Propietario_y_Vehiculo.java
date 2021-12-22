package com.gigeroa.vtv.entities;

public class Propietario_y_Vehiculo {
	Propietario propietario;
	Vehiculo vehiculo;

	public Propietario_y_Vehiculo(Propietario propietario, Vehiculo vehiculo) {
		this.propietario = propietario;
		this.vehiculo = vehiculo;
	}

	public Propietario getPropietario() {
		return propietario;
	}

	public void setPropietario(Propietario propietario) {
		this.propietario = propietario;
	}

	public Vehiculo getVehiculo() {
		return vehiculo;
	}

	public void setVehiculo(Vehiculo vehiculo) {
		this.vehiculo = vehiculo;
	}
	
}
