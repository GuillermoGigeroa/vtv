package com.gigeroa.vtv.services;

import com.gigeroa.vtv.entities.Matricula;
import com.gigeroa.vtv.repositories.IMatricula;

/*
 * Servicio creado para poder administrar las validaciones.
 */

public abstract class MatriculasService {

//	Método para procesar el texto ingresado y verificar si es válido
	public static IMatricula procesarMatricula(String matricula) {
		IMatricula resultado = null;
		
		// Se trabaja con los caracteres en mayúsculas.
		String matriculaActual = matricula.toUpperCase().trim();
		
		// Se verifica que la longitud de la matrícula sea la correcta.
		if (!(matriculaActual.length() >= 6 && matriculaActual.length() <= 7)) {
			return null;
		}
		
		// Se verifica que el formato de las matrículas sea válido.
		if (esNueva(matriculaActual) || esAntigua(matriculaActual)) {
			resultado = new Matricula(matriculaActual);
		}
		
		// Si todo es válido, entonces el resultado tiene que ser diferente de null.
		return resultado;
	}

//	Método para identificar si la matrícula ingresada tiene formato nuevo
	public static boolean esNueva(String matricula) {
		/*
		 * Se prueba la existencia de números utilizando la excepción
		 * NumberFormatException al parsearlo. Formato: AA111AA.
		 */
		try {
			
			// En esta parte se verifica que sea un número los 3 caracteres del medio.
			Integer.parseInt(matricula.substring(2, 5));
			
			// Luego se verifica que las letras del inicio y fin sean válidas.
			return esTexto(matricula.substring(0, 2)) && esTexto(matricula.substring(5));
			
		} catch (NumberFormatException error) {
			return false;
		}
	}

//	Método para identificar si la matrícula ingresada tiene formato antiguo 
	public static boolean esAntigua(String matricula) {
		/*
		 * Se prueba la existencia de números utilizando la excepción
		 * NumberFormatException al parsearlo. Formato: AAA111.
		 */
		try {
			
			// En esta parte se verifica que sea un número los últimos 3 caracteres.
			Integer.parseInt(matricula.substring(3, 6));
			
			// Luego se verifica que las primeras 3 letras sean válidas.
			return esTexto(matricula.substring(0, 3));
			
		} catch (NumberFormatException error) {
			return false;
		}
	}

//	Método para identificar si el string ingresado solo contiene letras del abecedario.
	public static boolean esTexto(String texto) {
		// Se pasa a mayúsculas por si es ingresado manualmente
		String textoUpper = texto.toUpperCase();
		char charActual;
		
		// Se recorre cada caracter, y se verifica si pertenece del grupo A-Z exceptuando Ñ
		for (int x = 0; x < textoUpper.length(); x++) {
			charActual = textoUpper.charAt(x);
			if (!(charActual >= 'A' && charActual <= 'Z' && charActual != 'Ñ')) {
				// Si se encuentra un caso anormal, se retorna false
				return false;
			}
		}
		
		// En caso de que todo esté bien, retorna true
		return true;
	}
}
