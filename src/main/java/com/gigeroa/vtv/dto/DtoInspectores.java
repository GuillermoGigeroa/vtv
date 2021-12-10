package com.gigeroa.vtv.dto;

import com.gigeroa.vtv.dao.DaoInspectores;
import com.gigeroa.vtv.entities.*;
import java.util.ArrayList;

public class DtoInspectores {
	private DaoInspectores dao;

//	Constructor
	public DtoInspectores() {
		dao = new DaoInspectores();
	}
	
//	Método para agregar un inspector
	public int agregarInspector(Inspector inspector) {
		return dao.agregarInspector(inspector);
	}
	
//	Método para dar de baja un inspector
	public int bajaInspector(Inspector inspector) {
		return dao.bajaInspector(inspector);
	}
	
//	Método sobrecargado para dar de baja un inspector solo con el id
	public int bajaInspector(int idInspector) {
		return dao.bajaInspector(idInspector);
	}
	
//	Método para modificar un inspector
	public int modificarInspector(int id, String nuevoNombre) {
		return dao.modificarInspector(id, nuevoNombre);
	}
	
//	Método sobrecargado para dar modificar un inspector insertando otro inspector
	public int modificarInspector(int id, Inspector inspector) {
		return dao.modificarInspector(id, inspector);
	}
	
//	Método para listar los inspectores
	public ArrayList<Inspector> listarInspectores(){
		return dao.listarInspectores();
	}
	
}
