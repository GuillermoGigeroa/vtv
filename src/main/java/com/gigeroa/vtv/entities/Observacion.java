package com.gigeroa.vtv.entities;

import java.util.ArrayList;
import com.gigeroa.vtv.repositories.*;
import com.gigeroa.vtv.services.ControlService;

public class Observacion implements IControl {
	private Estado luces;
	private Estado patente;
	private Estado espejos;
	private Estado chasis;
	private Estado vidrios;
	private Estado seguridad;
	private Estado emergencia;
	
//	Constructores
	public Observacion() {
		this.luces = new Estado();
		this.patente = new Estado();
		this.espejos = new Estado();
		this.chasis = new Estado();
		this.vidrios = new Estado();
		this.seguridad = new Estado();
		this.emergencia = new Estado();
	}
	
	public Observacion(Estado luces,
					   Estado patente,
					   Estado espejos,
					   Estado chasis,
					   Estado vidrios,
					   Estado seguridad,
					   Estado emergencia) {
		this.luces = luces;
		this.patente = patente;
		this.espejos = espejos;
		this.chasis = chasis;
		this.vidrios = vidrios;
		this.seguridad = seguridad;
		this.emergencia = emergencia;
	}
	
	public Observacion(int estado) {
		Estado estadoGeneral = new Estado(estado);
		this.luces = estadoGeneral;
		this.patente = estadoGeneral;
		this.espejos = estadoGeneral;
		this.chasis = estadoGeneral;
		this.vidrios = estadoGeneral;
		this.seguridad = estadoGeneral;
		this.emergencia = estadoGeneral;
	}

//	Getters y Setters
	public Estado getLuces() {
		return luces;
	}

	public void setLuces(Estado luces) {
		this.luces = luces;
	}

	public Estado getPatente() {
		return patente;
	}

	public void setPatente(Estado patente) {
		this.patente = patente;
	}

	public Estado getEspejos() {
		return espejos;
	}

	public void setEspejos(Estado espejos) {
		this.espejos = espejos;
	}

	public Estado getChasis() {
		return chasis;
	}

	public void setChasis(Estado chasis) {
		this.chasis = chasis;
	}

	public Estado getVidrios() {
		return vidrios;
	}

	public void setVidrios(Estado vidrios) {
		this.vidrios = vidrios;
	}

	public Estado getSeguridad() {
		return seguridad;
	}

	public void setSeguridad(Estado seguridad) {
		this.seguridad = seguridad;
	}

	public Estado getEmergencia() {
		return emergencia;
	}

	public void setEmergencia(Estado emergencia) {
		this.emergencia = emergencia;
	}

	@Override
	public String toString() {
		return ControlService.getEstado(this);
	}
	
//	Método que retorna un ArrayList de los estados de la observación
	public ArrayList<Estado> getListaEstados() {
		ArrayList<Estado> listaEstados = new ArrayList<Estado>();
		listaEstados.add(luces);
		listaEstados.add(patente);
		listaEstados.add(espejos);
		listaEstados.add(chasis);
		listaEstados.add(vidrios);
		listaEstados.add(seguridad);
		listaEstados.add(emergencia);
		return listaEstados;
	}
}
