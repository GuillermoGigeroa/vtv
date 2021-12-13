package com.gigeroa.vtv.repositories;

import com.gigeroa.vtv.exceptions.MatriculaInvalida;

public interface IMatricula {
	String sinMatricula = "Sin matricula";
	void setMatricula(String matricula) throws MatriculaInvalida;
	String getMatricula();
}
