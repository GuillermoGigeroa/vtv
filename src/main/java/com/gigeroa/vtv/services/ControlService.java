package com.gigeroa.vtv.services;

import com.gigeroa.vtv.entities.Estado;
import com.gigeroa.vtv.repositories.IControl;
import com.gigeroa.vtv.repositories.IEstado;
import java.util.Iterator;

public abstract class ControlService implements IEstado{
	
	// Método para analizar caso por caso el estado de los controles y devolver un estado en String
	public static String getEstado(IControl control) {
		Iterator<Estado> lista = control.getListaEstados().iterator();
		int contadorApto = 0;
		int contadorCondicional = 0;
		int contadorRechazado = 0;
		Estado estadoActual;
		while(lista.hasNext()) {
			estadoActual = lista.next();
			if(estadoActual.toString().equalsIgnoreCase(apto)) {
				contadorApto++;
			}
			if(estadoActual.toString().equalsIgnoreCase(condicional)) {
				contadorCondicional++;
			}
			if(estadoActual.toString().equalsIgnoreCase(rechazado)) {
				contadorRechazado++;
			}
		}
		if (contadorRechazado > 0) {
			return rechazado;
		}
		else if (contadorCondicional > 0) {
			return condicional;
		}
		else if (contadorApto > 0){
			return apto;
		}
		else {
			return error;
		}
	}
}
