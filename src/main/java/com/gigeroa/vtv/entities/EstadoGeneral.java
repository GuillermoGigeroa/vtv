package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.services.EstadosService;

public class EstadoGeneral  {
	private int tipoEstado;
	private Observacion observacion;
	private Medicion medicion;
	
//	Constructores
	public EstadoGeneral() {
		this.observacion = new Observacion();
		this.medicion = new Medicion();
		this.tipoEstado = identificarEstado();
	}
	
	public EstadoGeneral(Observacion observacion, Medicion medicion) {
		this.observacion = observacion;
		this.medicion = medicion;
		this.tipoEstado = identificarEstado();
	}
	
	public EstadoGeneral(int estado) {
		this.observacion = new Observacion(estado);
		this.medicion = new Medicion(estado);
		this.tipoEstado = identificarEstado();
	}

//	Métodos
	public Observacion getObservacion() {
		return observacion;
	}

	public void setObservacion(Observacion observacion) {
		this.observacion = observacion;
	}

	public Medicion getMedicion() {
		return medicion;
	}

	public void setMedicion(Medicion medicion) {
		this.medicion = medicion;
	}
	
	public int getTipoEstado() {
		return tipoEstado;
	}
	
	public void setTipoEstado(int estado) {
		this.tipoEstado = estado;
	}

	@Override
	public String toString() {
		if (observacion.toString() == Estado.apto && medicion.toString() == Estado.apto) {
			return Estado.apto;
		}
		if (observacion.toString() == Estado.rechazado || medicion.toString() == Estado.rechazado) {
			return Estado.rechazado;
		}
		if (observacion.toString() == Estado.condicional || medicion.toString() == Estado.condicional) {
			return Estado.condicional;
		}
		return Estado.error;
	}

	private int identificarEstado() {
		return EstadosService.numeroEstado(toString());
	}
}
