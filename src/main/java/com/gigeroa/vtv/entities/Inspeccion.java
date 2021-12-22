package com.gigeroa.vtv.entities;

import java.time.LocalDate;
import java.util.Objects;
import javax.persistence.*;

@Entity
@Table (name = "inspecciones")
public class Inspeccion {
	
	@Id
	@Column (name = "numero")
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Integer numero;
	
	@Column (name = "fecha")
	private LocalDate fecha;
	
	@Column (name = "fechavencimiento")
	private LocalDate fechaVencimiento;

	@Column (name = "legajoinspector")
	private int legajoInspector;
	
	@Column (name = "estado")
	private int estado;
	
//	Constructores
	public Inspeccion()
	{
		this.numero = -1;
		this.legajoInspector = -1;
		this.fecha = LocalDate.now();
		this.fechaVencimiento = LocalDate.now();
		this.estado = 3;
	}
	
	public Inspeccion(
			LocalDate fecha,
			Inspector inspector,
			Vehiculo vehiculo,
			int estado
			)
	{
		this.numero = -1;
		this.legajoInspector = inspector.getLegajo();
		this.fecha = fecha;
		this.fechaVencimiento = fecha.plusYears(1);
		this.estado = estado;
	}
	
	public Inspeccion(
			Integer numero,
			LocalDate fecha,
			Inspector inspector,
			Vehiculo vehiculo,
			int estado
			)
	{
		this.numero = numero;
		this.legajoInspector = inspector.getLegajo();
		this.fecha = fecha;
		this.fechaVencimiento = fecha.plusYears(1);
		this.estado = estado;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public LocalDate getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(LocalDate fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public int getLegajoInspector() {
		return legajoInspector;
	}

	public void setLegajoInspector(int legajoInspector) {
		this.legajoInspector = legajoInspector;
	}

	public int getEstado() {
		return estado;
	}

	public void setEstado(int estado) {
		this.estado = estado;
	}

	@Override
	public int hashCode() {
		return Objects.hash(estado, fecha, fechaVencimiento, legajoInspector, numero);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Inspeccion other = (Inspeccion) obj;
		return estado == other.estado && Objects.equals(fecha, other.fecha)
				&& Objects.equals(fechaVencimiento, other.fechaVencimiento) && legajoInspector == other.legajoInspector
				&& numero == other.numero;
	}
}
