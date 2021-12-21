package com.gigeroa.vtv.entities;

public enum EnumListaEstados {
	NUEVO(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
	APTO(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
	CONDICIONAL(2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2),
	RECHAZADO(3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3);
	private int
	suspension,
	direccion,
	frenos,
	contaminacion,
	luces,
	patente,
	espejos,
	chasis,
	vidrios,
	seguridad,
	emergencia;
	private EnumListaEstados (
			int suspension,
			int direccion,
			int frenos,
			int contaminacion,
			int luces,
			int patente,
			int espejos,
			int chasis,
			int vidrios,
			int seguridad,
			int emergencia)
	{
		this.suspension = suspension;
		this.direccion = direccion;
		this.frenos = frenos;
		this.contaminacion = contaminacion;
		this.luces = luces;
		this.patente = patente;
		this.espejos = espejos;
		this.chasis = chasis;
		this.vidrios = vidrios;
		this.seguridad = seguridad;
		this.emergencia = emergencia;
	}
	public int getSuspension() {
		return suspension;
	}
	public void setSuspension(int suspension) {
		this.suspension = suspension;
	}
	public int getDireccion() {
		return direccion;
	}
	public void setDireccion(int direccion) {
		this.direccion = direccion;
	}
	public int getFrenos() {
		return frenos;
	}
	public void setFrenos(int frenos) {
		this.frenos = frenos;
	}
	public int getContaminacion() {
		return contaminacion;
	}
	public void setContaminacion(int contaminacion) {
		this.contaminacion = contaminacion;
	}
	public int getLuces() {
		return luces;
	}
	public void setLuces(int luces) {
		this.luces = luces;
	}
	public int getPatente() {
		return patente;
	}
	public void setPatente(int patente) {
		this.patente = patente;
	}
	public int getEspejos() {
		return espejos;
	}
	public void setEspejos(int espejos) {
		this.espejos = espejos;
	}
	public int getChasis() {
		return chasis;
	}
	public void setChasis(int chasis) {
		this.chasis = chasis;
	}
	public int getVidrios() {
		return vidrios;
	}
	public void setVidrios(int vidrios) {
		this.vidrios = vidrios;
	}
	public int getSeguridad() {
		return seguridad;
	}
	public void setSeguridad(int seguridad) {
		this.seguridad = seguridad;
	}
	public int getEmergencia() {
		return emergencia;
	}
	public void setEmergencia(int emergencia) {
		this.emergencia = emergencia;
	}
	
}
