package com.gigeroa.vtv.services;

import com.gigeroa.vtv.entities.Matricula;
import com.gigeroa.vtv.repositories.IMatricula;

/*
 * Servicio creado para poder administrar las validaciones.
 */

public abstract class MatriculasService {
	
//	Método para procesar el texto ingresado y verificar si es válido
	public IMatricula procesarMatricula (String matricula) {
		IMatricula resultado = null;
		String matriculaActual = matricula.toUpperCase().trim();
		if (!(matriculaActual.length() >= 6 && matriculaActual.length() <= 7)) {
			return null;
		}
		if (esNueva(matriculaActual) || esAntigua(matriculaActual)) {
			resultado = new Matricula(matriculaActual);
		}
		return resultado;
	}
	
//	Método para identificar si la matrícula ingresada es formato nuevo
	public static boolean esNueva (String matricula) {
		/*	
		 * Se prueba la existencia de números utilizando
		 * la excepción NumberFormatException al parsearlo.
		 * Formato: AA111AA.
		 */
		try {
			Integer.valueOf(matricula.charAt(2));
			Integer.valueOf(matricula.charAt(3));
			Integer.valueOf(matricula.charAt(4));
			return true;
		}
		catch (NumberFormatException error) {
			return false;
		}
	}

//	Método para identificar si la matrícula ingresada es formato antiguo 
	public static boolean esAntigua (String matricula) {
		/*	
		 * Se prueba la existencia de números utilizando
		 * la excepción NumberFormatException al parsearlo.
		 * Formato: AAA111.
		 */
		try {
			Integer.valueOf(matricula.charAt(3));
			Integer.valueOf(matricula.charAt(4));
			Integer.valueOf(matricula.charAt(5));
			return true;
		}
		catch (NumberFormatException error) {
			return false;
		}
	}
}
