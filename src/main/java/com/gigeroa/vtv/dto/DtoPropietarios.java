package com.gigeroa.vtv.dto;

import com.gigeroa.vtv.dao.DaoPropietarios;
import com.gigeroa.vtv.entities.*;
import java.util.ArrayList;

public class DtoPropietarios {
	private DaoPropietarios dao;

//	Constructor
	public DtoPropietarios() {
		dao = new DaoPropietarios();
	}

//	Método para agregar un propietario
	public int agregarPropietario(Propietario propietario) {
		return dao.agregarPropietario(propietario);
	}

//	Método para dar de baja un propietario
	public int bajaPropietario(Propietario propietario) {
		return dao.bajaPropietario(propietario);
	}

//	Método sobrecargado para dar de baja un propietario con el id
	public int bajaPropietario(int idPropietario) {
		return dao.bajaPropietario(idPropietario);
	}

//	Método para modificar un propietario
	public int modificarPropietario(int id, String nuevoNombre, Boolean nuevoExento) {
		return dao.modificarPropietario(id, nuevoNombre, nuevoExento);
	}

//	Método sobrecargado para dar modificar un propietario insertando otro
//	propietario
	public int modificarPropietario(int id, Propietario propietario) {
		return dao.modificarPropietario(id, propietario);
	}

//	Método para listar los propietarios
	public ArrayList<Propietario> listarPropietarios() {
		return dao.listarPropietarios();
	}
	
}
