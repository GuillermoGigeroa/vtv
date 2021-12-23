package com.gigeroa.vtv.services;

import com.gigeroa.vtv.repositories.IControl;
import com.gigeroa.vtv.repositories.IEstado;

public abstract class EstadosService implements IEstado {
//	Método que compara un String con los estados y retorna un int con el tipo de estado
	public static int estadoToNumero(String estado) {
		if (estado.equalsIgnoreCase(apto)) {
			return aptoNumero;
		} else if (estado.equalsIgnoreCase(condicional)) {
			return condicionalNumero;
		} else if (estado.equalsIgnoreCase(rechazado)) {
			return rechazadoNumero;
		} else {
			return errorNumero;
		}
	}
	
//	Método para convertir de un número a un estado en String
	public static String numeroToEstado(int estado) {
		if (estado == 1) {
			return apto;
		} else if (estado == 2) {
			return condicional;
		} else if (estado == 3) {
			return rechazado;
		} else {
			return error;
		}
	}
	
//	Método para verificar el resultado de dos controles, pueden ser observacion, medicion o biceversa
	public static int getEstado(IControl observacion, IControl medicion) {
		if (observacion.toString().equalsIgnoreCase(apto) && medicion.toString().equalsIgnoreCase(apto)) {
			return aptoNumero;
		}
		if (observacion.toString().equalsIgnoreCase(rechazado) || medicion.toString().equalsIgnoreCase(rechazado)) {
			return rechazadoNumero;
		}
		if (observacion.toString().equalsIgnoreCase(condicional) || medicion.toString().equalsIgnoreCase(condicional)) {
			return condicionalNumero;
		}
		return errorNumero;
	}

}
