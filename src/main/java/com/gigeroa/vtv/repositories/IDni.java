package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.exceptions.DniInvalido;

public interface IDni {
	int sinNumero = 0;
	void setNumero(String numeroIngresado) throws DniInvalido;
	int getNumero();
}
