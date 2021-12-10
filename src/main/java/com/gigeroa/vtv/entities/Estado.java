package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.repositories.*;

public class Estado implements IEstado {
	private int tipoEstado;

//	Constructor
	public Estado() {
		this.tipoEstado = 3;
	}
	
	public Estado(int tipoEstado) {
		this.tipoEstado = tipoEstado;
	}

//	Getters y Setters
	public int getTipoEstado() {
		return tipoEstado;
	}
	
	public void setTipoEstado(int tipoEstado) {
		this.tipoEstado = tipoEstado;
	}

	@Override
	public String toString() {
		switch (tipoEstado) {
		case 1:
			return apto;
		case 2:
			return condicional;
		case 3:
			return rechazado;
		default:
			return error;
		}
	}

	public String formatoExportacion() {
		return this.toString();
	}
	
}
