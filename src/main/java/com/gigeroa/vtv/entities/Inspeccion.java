package com.gigeroa.vtv.entities;

import java.time.LocalDate;
import com.gigeroa.vtv.repositories.*;

public class Inspeccion implements IContieneID {
	private int numero;
	private LocalDate fecha;
	private LocalDate fechaVencimiento;
	private Inspector inspector;
	private Vehiculo vehiculo;
	private EstadoGeneral estadoGeneral;
	
//	Constructores
	public Inspeccion(
			int numero,
			LocalDate fecha,
			Inspector inspector,
			Vehiculo vehiculo,
			EstadoGeneral estadoGeneral
			)
	{
		this.numero = numero;
		this.fecha = fecha;
		this.fechaVencimiento = fecha.plusYears(1);
		this.inspector = inspector;
		this.vehiculo = vehiculo;
		this.estadoGeneral = estadoGeneral;
	}

//	Métodos
	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public LocalDate getFecha() {
		return fecha;
	}
	
	public LocalDate getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
		this.fechaVencimiento = fecha.plusYears(1);
	}

	public Inspector getInspector() {
		return inspector;
	}

	public void setInspector(Inspector inspector) {
		this.inspector = inspector;
	}

	public Vehiculo getVehiculo() {
		return vehiculo;
	}

	public void setVehiculo(Vehiculo vehiculo) {
		this.vehiculo = vehiculo;
	}

	public EstadoGeneral getEstadoGeneral() {
		return estadoGeneral;
	}

	public void setEstadoGeneral(EstadoGeneral estadoGeneral) {
		this.estadoGeneral = estadoGeneral;
	}
	
	public int getID() {
		return numero;
	}
	
	public void setID(int id) {
		numero = id;
	}

	@Override
	public String toString() {
		return "Número de inspección: " + numero
				+ "\n" + "Fecha de inspecci�n: " + fecha.toString()
				+ "\n" + "Estado: " + estadoGeneral
				+ "\n" + "Propietario: " + vehiculo.getPropietario().getNombre()
				+ "\n" + "Es excento: " + (vehiculo.getPropietario().isExento() ? "Si": "No")
				+ "\n" + "Inspector a cargo: " + inspector
				+ "\n" + "Datos del vehiculo: "+ vehiculo;
	}
	
}
