package com.gigeroa.vtv.services;

/*
 * Servicio creado para poder administrar las validaciones.
 */

public abstract class MatriculasService {
	
//	Método para procesar el texto ingresado y verificar si es válido
	public boolean procesarMatricula (String matricula) {
		String matriculaActual = matricula.toUpperCase().trim();
		// TODO verificar longitud maxima y mínima
		if (esNueva(matriculaActual)) {
//			Código para matrícula nueva
			return true;
		}
		else {
//			Código para matrícula antigua
			return false;
		}
	}
	
//	Método para identificar si la matrícula ingresada es formato antiguo o nuevo
	public static boolean esNueva (String matricula) {
		/*	
		 * Se verifica el tercer caracter ya que 
		 * al tener una matrícula "AA123AA"
		 * el tercer caracter es un número, pero
		 * en cambio en "AAA123" el tercer caracter
		 * es una letra, y esto desencadena una
		 * NumberFormatException.
		 */
		try {
			Integer.valueOf(matricula.charAt(2));
			return true;
		}
		catch (NumberFormatException error) {
			return false;
		}
	}
}
