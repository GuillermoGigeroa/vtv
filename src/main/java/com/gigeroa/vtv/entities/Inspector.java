package com.gigeroa.vtv.entities;

import java.util.Objects;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.repositories.*;

@Entity
@Table (name = "inspectores")
public class Inspector implements IPersona {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int legajo;
	
	@Column (name = "dni")
	private int dni;

	@NotEmpty (message = "El campo nombre no puede estar vacío.")
	@Column (name = "nombre")
	private String nombre;

	@NotEmpty (message = "El campo apellido no puede estar vacío.")
	@Column (name = "apellido")
	private String apellido;
	
//	Constructores
	public Inspector() {
		this.legajo = IDni.sinNumero;
		this.dni = IDni.sinNumero;
		this.nombre = sinNombre;
		this.apellido = sinApellido;
	}
	
	public Inspector(String dni, String nombre) throws DniInvalido {
		setDni(dni);
		this.nombre = nombre;
	}

	public Inspector(int dni, String nombre) throws DniInvalido {
		this.dni = (new Dni(dni)).getNumero();
		this.nombre = nombre;
	}

	public int getLegajo() {
		return legajo;
	}

	public void setLegajo(int legajo) {
		this.legajo = legajo;
	}

	public int getDni() {
		return dni;
	}

	@Override
	public void setDni(String dni) throws DniInvalido {
		this.dni = (new Dni(dni)).getNumero();
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	@Override
	public int hashCode() {
		return Objects.hash(apellido, dni, legajo, nombre);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Inspector other = (Inspector) obj;
		return Objects.equals(apellido, other.apellido) && dni == other.dni && legajo == other.legajo
				&& Objects.equals(nombre, other.nombre);
	}
	
}
