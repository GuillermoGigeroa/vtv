package com.gigeroa.vtv.exceptions;

public class DniInvalido extends Exception {

	private static final long serialVersionUID = 1L;

	@Override
	public String getMessage() {
		return "El numero de DNI posee letras";
	}

}
