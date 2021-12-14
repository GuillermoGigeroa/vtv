package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.exceptions.MatriculaInvalida;
import com.gigeroa.vtv.repositories.*;

public class Vehiculo implements IContieneID {
	private int id;
	private IMatricula matricula;
	private String marca;
	private String modelo;
	private Propietario propietario;
	
//	Constructores
	public Vehiculo(String matricula, String marca, String modelo, Propietario propietario) throws MatriculaInvalida {
		this.id = -1;
		setMatricula(matricula);
		this.marca = marca;
		this.modelo = modelo;
		this.propietario = propietario;
	}
	
	public Vehiculo(int id, String matricula, String marca, String modelo, Propietario propietario) throws MatriculaInvalida {
		this.id = id;
		setMatricula(matricula);
		this.marca = marca;
		this.modelo = modelo;
		this.propietario = propietario;
	}

//	Métodos
	public String getMatricula() {
		return matricula.getMatricula();
	}

	public void setMatricula(String matricula) throws MatriculaInvalida {
		this.matricula = new Matricula(matricula);
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public Propietario getPropietario() {
		return propietario;
	}

	public void setPropietario(Propietario propietario) {
		this.propietario = propietario;
	}
	
	public int getID() {
		return id;
	}
	
	public void setID(int id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return marca + " - " + modelo + " - " + matricula;
	}
}
