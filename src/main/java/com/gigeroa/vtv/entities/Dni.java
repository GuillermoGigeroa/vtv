package com.gigeroa.vtv.entities;

import java.util.Objects;

import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.repositories.IDni;
import com.gigeroa.vtv.services.DniService;

public class Dni implements IDni {
	private int numero;
	
//	Constructores
	public Dni() {
		numero = sinNumero;
	}

	public Dni (String numero) throws DniInvalido {
		setNumero(numero);
	}
	
	public Dni (int numero) {
		this.numero = numero;
	}
	
//	Métodos
	public int getNumero() {
		return numero;
	}

	@Override
	public String toString() {
		return String.valueOf(numero);
	}

//	En el setter se verifica si el número es válido para continuar.
	public void setNumero(String numeroIngresado) throws DniInvalido {
		if (DniService.verificarDniInvalido(numeroIngresado)) {
			numero = Integer.parseInt(numeroIngresado);
		}
		else {
			throw new DniInvalido();
		}
	}

	@Override
	public int hashCode() {
		return Objects.hash(numero);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Dni other = (Dni) obj;
		return numero == other.numero;
	}

}
