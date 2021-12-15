package com.gigeroa.vtv.services;

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
	
//	TODO Hacer un método que permita identificar en BBDD si existe el inspector antes de ingresarlo
	public void verificarDniInspector (IDni dni) {}
	
//	TODO Hacer un método que permita identificar en BBDD si existe el propietario antes de ingresarlo
	public void verificarDniPropietario (IDni dni) {}
	
}
