package com.gigeroa.vtv.dto;

import com.gigeroa.vtv.dao.*;
import com.gigeroa.vtv.entities.*;
import java.time.LocalDate;
import java.util.ArrayList;

public class DtoInspecciones {
	private DaoInspeccion dao;
	
//	Constructor
	public DtoInspecciones() {
		dao = new DaoInspeccion();
	}

//	Método para agregar una inspección
	public int agregarInspeccion(Inspeccion inspeccion) {
		return dao.agregarInspeccion(inspeccion);
	}
	
//	Método para dar de baja una inspección
	public int bajaInspeccion(Inspeccion inspeccion) {
		return dao.bajaInspeccion(inspeccion);
	}
	
//	Método sobrecargado para dar de baja una inspección solo con el id
	public int bajaInspeccion(int idInspeccion) {
		return dao.bajaInspeccion(idInspeccion);
	}
	
//	Método sobrecargado para dar modificar una inspección insertando otra
//	inspección
	public int modificarInspeccion(int id, Inspeccion inspeccion) {
		return dao.modificarInspeccion(id, inspeccion);
	}

//	Método para modificar una inspección
	public int modificarInspeccion(int id, LocalDate fecha, int idNuevoInspector, int idNuevoEstado,
			int idNuevoVehiculo) {
		return dao.modificarInspeccion(id, fecha, idNuevoInspector, idNuevoEstado, idNuevoVehiculo);
	}
	
//	Método para listar las inspecciones por fecha
	public ArrayList<Inspeccion> listarInspeccionesPorFecha(LocalDate fechaIngresada) {
		return dao.listarInspeccionesPorFecha(fechaIngresada);
	}
	
//	Método para listar las inspecciones
	public ArrayList<Inspeccion> listarInspecciones(){
		return dao.listarInspecciones();
	}
	
//	Método para listar las inspecciones por propietario
	public ArrayList<Inspeccion> listarInspeccionesPorPropietario(int IDPropietario) {
		return dao.listarInspeccionesPorPropietario(IDPropietario);
	}
	
//	Método sobrecargado para listar las inspecciones por propietario ingresando
//	un objeto propietario
	public ArrayList<Inspeccion> listarInspeccionesPorPropietario(Propietario propietario){
		return dao.listarInspeccionesPorPropietario(propietario);		
	}
	
	
}
