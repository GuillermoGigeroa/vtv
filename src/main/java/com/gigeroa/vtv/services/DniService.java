package com.gigeroa.vtv.services;

import com.gigeroa.vtv.dto.DtoInspectores;
import com.gigeroa.vtv.dto.DtoPropietarios;
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
		for(Inspector inspector : (new DtoInspectores()).listarInspectores()) {
			if (dni.getNumero() == inspector.getDni().getNumero()) {
				return true;
			}
		}
		return false;
	}
	
//	Método que permite identificar en BBDD si existe un DNI de propietario
	public static boolean existeDniPropietario (IDni dni) {
		for(Propietario propietario : (new DtoPropietarios()).listarPropietarios()) {
			if (dni.getNumero() == propietario.getDni().getNumero()) {
				return true;
			}
		}
		return false;
	}
	
}
