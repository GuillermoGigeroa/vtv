package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.repositories.IMatricula;

public class Matricula implements IMatricula {

	private String matricula;
	
//	Constructores
	public Matricula() {
		matricula = sinMatricula;
	}
	
	public Matricula(String matricula) {
		this.matricula = matricula;
	}

//	Métodos
	@Override
	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	@Override
	public String getMatricula() {
		return matricula;
	}
	
}
