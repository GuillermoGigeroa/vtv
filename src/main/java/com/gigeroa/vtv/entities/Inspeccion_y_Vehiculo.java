package com.gigeroa.vtv.entities;

public class Inspeccion_y_Vehiculo {
	Inspeccion inspeccion;
	Vehiculo vehiculo;

	public Inspeccion_y_Vehiculo(Inspeccion inspeccion, Vehiculo vehiculo) {
		this.inspeccion = inspeccion;
		this.vehiculo = vehiculo;
	}

	public Inspeccion getInspeccion() {
		return inspeccion;
	}

	public void setInspeccion(Inspeccion inspeccion) {
		this.inspeccion = inspeccion;
	}

	public Vehiculo getVehiculo() {
		return vehiculo;
	}

	public void setVehiculo(Vehiculo vehiculo) {
		this.vehiculo = vehiculo;
	}
	
}
