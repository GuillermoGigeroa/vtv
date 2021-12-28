package com.gigeroa.vtv.services;

import com.gigeroa.vtv.dto.DtoInspectoresImpl;
import com.gigeroa.vtv.dto.DtoPropietariosImpl;
import com.gigeroa.vtv.entities.Inspector;

public abstract class DniService {
	
//	Método para verificar si el dni es válido o no
	public static boolean verificarDniInvalido(String dni) {
		try {
			// Se verifica si el valor ingresado es numérico usando la excepción de Java
			Integer.valueOf(dni);
			
			// Luego si la longitud del dni ingresado es correcta.
			if (dni.length() == 7 || dni.length() == 8) {
				return true;
			}
			return false;
		} catch (NumberFormatException e) {
			return false;
		}
	}
	
//	Método que permite identificar en BBDD si existe un DNI de inspector
	public static boolean existeDniInspector (int dni, DtoInspectoresImpl dto) {
		for (Inspector inspector : dto.listar()) {
			if (inspector.getDni() == dni) {
				return true;
			}
		}
		return false;
	}
	
//	Método que permite identificar en BBDD si existe un DNI de propietario
	public static boolean existeDniPropietario (int dni, DtoPropietariosImpl dto) {
		if (dto.buscar(dni) != null) {
			return true;
		}
		return false;
	}
}
