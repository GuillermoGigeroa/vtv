package com.gigeroa.vtv.entities;

import javax.persistence.*;
import com.gigeroa.vtv.exceptions.MatriculaInvalida;
import com.gigeroa.vtv.repositories.*;

@Entity
@Table (name = "vehiculos")
public class Vehiculo implements IContieneID {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;

	@Column (name = "dominio")
	private String matricula;

	@Column (name = "marca")
	private String marca;

	@Column (name = "modelo")
	private String modelo;
	
//	Constructores
	public Vehiculo(){
		this.id = -1;
		this.matricula = "00ZZZ00";
		this.marca = "default";
		this.modelo = "default";
	}
	
	public Vehiculo(String matricula, String marca, String modelo) throws MatriculaInvalida {
		this.id = -1;
		setMatricula(matricula);
		this.marca = marca;
		this.modelo = modelo;
	}
	
	public Vehiculo(int id, String matricula, String marca, String modelo) throws MatriculaInvalida {
		this.id = id;
		setMatricula(matricula);
		this.marca = marca;
		this.modelo = modelo;
	}

//	Métodos
	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) throws MatriculaInvalida {
		this.matricula = (new Matricula(matricula)).getMatricula();
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
