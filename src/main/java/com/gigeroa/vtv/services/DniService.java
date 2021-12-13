package com.gigeroa.vtv.services;

public abstract class DniService {
	
	//	Método para verificar si el dni es válido o no
	public static boolean verificarDniInvalido(String dni) {
		try {
			// Se verifica si el valor ingresado es numérico usando la excepción de Java
			Integer.valueOf(dni);
			
			// Luego si la longitud del dni ingresado es correcta, continúa.
			if (dni.length() == 7 || dni.length() == 8) {
				return true;
			}
			return false;
		} catch (NumberFormatException e) {
			return false;
		}
	}
}
