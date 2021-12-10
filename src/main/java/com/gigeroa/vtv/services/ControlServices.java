package com.gigeroa.vtv.services;

import com.gigeroa.vtv.entities.Estado;
import com.gigeroa.vtv.repositories.*;
import java.util.Iterator;

public abstract class ControlServices {
	
	// Método para analizar caso por caso el estado de los controles y devolver un estado en String
	public static String getEstado(IControl control) {
		Iterator<Estado> lista = control.getListaEstados().iterator();
		int contadorApto = 0;
		int contadorCondicional = 0;
		int contadorRechazado = 0;
		Estado estadoActual;
		while(lista.hasNext()) {
			estadoActual = lista.next();
			if(estadoActual.toString() == Estado.apto) {
				contadorApto++;
			}
			if(estadoActual.toString() == Estado.condicional) {
				contadorCondicional++;
			}
			if(estadoActual.toString() == Estado.rechazado) {
				contadorRechazado++;
			}
		}
		if (contadorRechazado > 0) {
			return Estado.rechazado;
		}
		else if (contadorCondicional > 0) {
			return Estado.condicional;
		}
		else if (contadorApto > 0){
			return Estado.apto;
		}
		else {
			return "Error";
		}
	}
	
	// Método que compara un String con los estados y retorna un int con el estado
	private static int numeroEstado(String estado) {
		if (estado.equalsIgnoreCase(Estado.apto)) {
			return 1;
		} else if (estado.equalsIgnoreCase(Estado.condicional)) {
			return 2;
		} else if (estado.equalsIgnoreCase(Estado.rechazado)) {
			return 3;
		} else {
			return 0;
		}
	}
}
