package com.gigeroa.vtv.exceptions;

public class MatriculaInvalida extends Exception {

	private static final long serialVersionUID = 1L;

	@Override
	public String getMessage() {
		return "La matrícula ingresada no es válida, ingrese en formato \"AAA123\" o \"AA111AA\"";
	}

}
