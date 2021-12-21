package com.gigeroa.vtv.entities;

import java.util.Objects;
import javax.persistence.*;

@Entity
@Table (name = "modelos_x_marca")
public class Modelos_x_Marca {
	@Id
	@Column (name = "id_modelo")
	int idModelo;

	@Column (name = "id_marca")
	int idMarca;


//	Constructores
	public Modelos_x_Marca() {
		idMarca = -1;
		idModelo = -1;
	}

	public Modelos_x_Marca(int idMarca, int idModelo) {
		this.idMarca = idMarca;
		this.idModelo = idModelo;
	}

//	Métodos
	public int getIdMarca() {
		return idMarca;
	}

	public void setIdMarca(int idMarca) {
		this.idMarca = idMarca;
	}

	public int getIdModelo() {
		return idModelo;
	}

	public void setIdModelo(int idModelo) {
		this.idModelo = idModelo;
	}

	@Override
	public int hashCode() {
		return Objects.hash(idMarca, idModelo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Modelos_x_Marca other = (Modelos_x_Marca) obj;
		return idMarca == other.idMarca && idModelo == other.idModelo;
	}
	
}
