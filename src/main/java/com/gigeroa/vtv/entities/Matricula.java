package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.exceptions.MatriculaInvalida;
import com.gigeroa.vtv.repositories.IMatricula;
import com.gigeroa.vtv.services.MatriculasService;

public class Matricula implements IMatricula {

	private String matricula;
	
//	Constructores
	public Matricula() {
		matricula = sinMatricula;
	}
	
	public Matricula(String matricula) throws MatriculaInvalida {
		setMatricula(matricula);
	}

//	Métodos
	@Override
	public void setMatricula(String matricula) throws MatriculaInvalida {
		if (MatriculasService.procesarMatricula(matricula) != null) {
			this.matricula = MatriculasService.procesarMatricula(matricula);
		}
		else {
			throw new MatriculaInvalida();
		}
	}

	@Override
	public String getMatricula() {
		return matricula;
	}
	
}
