package com.gigeroa.vtv.entities;

import java.util.ArrayList;
import com.gigeroa.vtv.repositories.*;

public class Medicion implements IControl {
	private Estado suspension;
	private Estado direccion;
	private Estado frenos;
	private Estado contaminacion;
	
//	Constructores
	public Medicion() {
		this.suspension = new Estado();
		this.direccion = new Estado();
		this.frenos = new Estado();
		this.contaminacion = new Estado();
	}
	
	public Medicion(Estado suspension, Estado direccion, Estado frenos, Estado contaminacion) {
		this.suspension = suspension;
		this.direccion = direccion;
		this.frenos = frenos;
		this.contaminacion = contaminacion;
	}

	public Medicion(int estado) {
		Estado estadoGeneral = new Estado(estado);
		this.suspension = estadoGeneral;
		this.direccion = estadoGeneral;
		this.frenos = estadoGeneral;
		this.contaminacion = estadoGeneral;
	}

//	Getters y Setters
	public Estado getSuspension() {
		return suspension;
	}

	public void setSuspension(Estado suspension) {
		this.suspension = suspension;
	}

	public Estado getDireccion() {
		return direccion;
	}

	public void setDireccion(Estado direccion) {
		this.direccion = direccion;
	}

	public Estado getFrenos() {
		return frenos;
	}

	public void setFrenos(Estado frenos) {
		this.frenos = frenos;
	}

	public Estado getContaminacion() {
		return contaminacion;
	}

	public void setContaminacion(Estado contaminacion) {
		this.contaminacion = contaminacion;
	}

//	Metodos
	@Override
	public String toString() {
		return Util.getEstado(this);
	}

	public ArrayList<Estado> getListaEstados() {
		ArrayList<Estado> listaEstados = new ArrayList<Estado>();
		listaEstados.add(suspension);
		listaEstados.add(direccion);
		listaEstados.add(frenos);
		listaEstados.add(contaminacion);
		return listaEstados;
	}

	public String formatoExportacion() {
		return suspension.toString()
				+ "," + direccion.toString()
				+ "," + frenos.toString()
				+ "," + contaminacion.toString();
	}
	
}
