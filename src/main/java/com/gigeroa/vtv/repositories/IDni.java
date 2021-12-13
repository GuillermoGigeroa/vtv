package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.exceptions.DniInvalido;

public interface IDni {
	String sinNumero = "Sin numero";
	void setNumero(String numero) throws DniInvalido;
	String getNumero();
}
