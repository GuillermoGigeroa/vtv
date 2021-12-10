package com.gigeroa.vtv.services;

import com.gigeroa.vtv.entities.Estado;

public abstract class EstadosServices {
	// Método que compara un String con los estados y retorna un int con el estado
	public static int numeroEstado(String estado) {
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
