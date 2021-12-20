package com.gigeroa.vtv.services;

import com.gigeroa.vtv.dto.DtoInspectoresImpl;
import com.gigeroa.vtv.dto.DtoPropietariosImpl;
import com.gigeroa.vtv.entities.Inspector;
import com.gigeroa.vtv.entities.Propietario;
import com.gigeroa.vtv.repositories.IDni;

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
	public static boolean existeDniInspector (IDni dni) {
		for(Inspector inspector : (new DtoInspectoresImpl()).listarInspectores()) {
			if (dni.getNumero() == inspector.getDni()) {
				return true;
			}
		}
		return false;
	}
	
//	Método que permite identificar en BBDD si existe un DNI de propietario
	public static boolean existeDniPropietario (IDni dni) {
		for(Propietario propietario : (new DtoPropietariosImpl()).listarPropietarios()) {
			if (dni.getNumero() == propietario.getDni()) {
				return true;
			}
		}
		return false;
	}
	
}
