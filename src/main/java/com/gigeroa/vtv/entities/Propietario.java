package com.gigeroa.vtv.entities;

import java.util.Objects;
import javax.persistence.*;
import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.repositories.*;

@Entity
@Table (name = "propietarios")
public class Propietario implements IPersona{
	
	@Id
	@Column (name = "dni")
	private int dni;
	
	@Column (name = "nombre")
	private String nombre;

	@Column (name = "apellido")
	private String apellido;
	
	@Column (name = "exento")
	private boolean exento;
	
//	Constructores
	public Propietario() throws DniInvalido {
		setDni(sinDni);
		this.nombre = "";
		this.apellido = "";
		this.exento = false;
	}
	
	public Propietario(int dni, String nombre, String apellido, boolean exento) throws DniInvalido {
		this.dni = dni;
		this.nombre = nombre;
		this.apellido = apellido;
		this.exento = exento;
	}
	
	public Propietario(String dni, String nombre, String apellido, boolean exento) throws DniInvalido {
		this.dni = (new Dni(dni)).getNumero();
		this.nombre = nombre;
		this.apellido = apellido;
		this.exento = exento;
	}

//	Métodos
	@Override
	public String getNombre() {
		return nombre;
	}

	@Override
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public boolean isExento() {
		return exento;
	}

	public String esExento() {
		return exento ? "Si" : "No";
	}

	public void setExento(boolean exento) {
		this.exento = exento;
	}
	
	@Override
	public int getDni() {
		return dni;
	}
	
	@Override
	public void setDni(String dni) throws DniInvalido {
		this.dni = (new Dni(dni)).getNumero();
	}

	@Override
	public String toString() {
		return nombre + " - Dni: "+ getDni();
	}

	@Override
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	@Override
	public String getApellido() {
		return apellido;
	}

	@Override
	public int hashCode() {
		return Objects.hash(apellido, dni, exento, nombre);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Propietario other = (Propietario) obj;
		return Objects.equals(apellido, other.apellido) && Objects.equals(dni, other.dni) && exento == other.exento
				&& Objects.equals(nombre, other.nombre);
	}

}
