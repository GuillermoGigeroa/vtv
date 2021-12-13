package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.repositories.IDni;
import com.gigeroa.vtv.services.DniService;

public class Dni implements IDni {
	private String numero;
	
//	Constructores
	public Dni() {
		numero = sinNumero;
	}

	public Dni (String numero) throws DniInvalido {
		setNumero(numero);
	}
	
//	Métodos
	public String getNumero() {
		return numero;
	}

//	En el setter, se verifica si el número es válido para continuar.
	public void setNumero(String numero) throws DniInvalido {
		if (DniService.verificarDniInvalido(this.numero)) {
			this.numero = numero;
		}
		else {
			throw new DniInvalido();
		}
	}

}
