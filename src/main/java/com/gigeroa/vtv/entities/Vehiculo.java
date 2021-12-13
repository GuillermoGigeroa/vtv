package com.gigeroa.vtv.entities;

import com.gigeroa.vtv.repositories.*;

public class Vehiculo implements IContieneID {
	private int id;
	private String dominio;
	private String marca;
	private String modelo;
	private Propietario propietario;
	
//	Constructores
	public Vehiculo(String dominio, String marca, String modelo, Propietario propietario) {
		this.id = -1;
		this.dominio = dominio;
		this.marca = marca;
		this.modelo = modelo;
		this.propietario = propietario;
	}
	
	public Vehiculo(int id, String dominio, String marca, String modelo, Propietario propietario) {
		this.id = id;
		this.dominio = dominio;
		this.marca = marca;
		this.modelo = modelo;
		this.propietario = propietario;
	}

//	Métodos
	public String getDominio() {
		return dominio;
	}

	public void setDominio(String dominio) {
		this.dominio = dominio;
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
		return marca + " - " + modelo + " - " + dominio;
	}
}
