package com.gigeroa.vtv.services;

import com.gigeroa.vtv.repositories.IControl;
import com.gigeroa.vtv.repositories.IEstado;

public abstract class EstadosService implements IEstado {
//	Método que compara un String con los estados y retorna un int con el tipo de estado
	public static int numeroEstado(String estado) {
		if (estado.equalsIgnoreCase(apto)) {
			return 1;
		} else if (estado.equalsIgnoreCase(condicional)) {
			return 2;
		} else if (estado.equalsIgnoreCase(rechazado)) {
			return 3;
		} else {
			return 0;
		}
	}
	
//	Método para verificar el resultado de dos controles, pueden ser observacion, medicion o biceversa
	public static int getEstado(IControl observacion, IControl medicion) {
		if (observacion.toString().equalsIgnoreCase(apto) && medicion.toString().equalsIgnoreCase(apto)) {
			return numeroEstado(apto);
		}
		if (observacion.toString().equalsIgnoreCase(rechazado) || medicion.toString().equalsIgnoreCase(rechazado)) {
			return numeroEstado(rechazado);
		}
		if (observacion.toString().equalsIgnoreCase(condicional) || medicion.toString().equalsIgnoreCase(condicional)) {
			return numeroEstado(condicional);
		}
		return numeroEstado(error);
	}

}
