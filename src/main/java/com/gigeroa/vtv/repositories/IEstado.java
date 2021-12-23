package com.gigeroa.vtv.repositories;

/*
 *	Interfaz creada para administrar los estados
 */

public interface IEstado {
	public final String apto = "Apto";
	public final String condicional = "Condicional";
	public final String rechazado = "Rechazado";
	public final String error = "Error";
	public final int aptoNumero = 1;
	public final int condicionalNumero = 2;
	public final int rechazadoNumero = 3;
	public final int errorNumero = 4;
}
