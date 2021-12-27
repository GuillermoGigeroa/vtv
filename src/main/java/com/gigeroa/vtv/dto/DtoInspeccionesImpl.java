package com.gigeroa.vtv.dto;

import com.gigeroa.vtv.dao.DaoInspecciones;
import com.gigeroa.vtv.entities.*;
import com.gigeroa.vtv.repositories.DtoInspecciones;

import java.util.ArrayList;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DtoInspeccionesImpl implements DtoInspecciones {
	
	@Autowired
	DaoInspecciones dao;
	
	@Autowired
	DtoVehiculos_x_PropietarioImpl dtoVXP;

	@Autowired
	DtoInspecciones_x_VehiculoImpl dtoIXV;
	
	@Override
	@Transactional (readOnly = true)
	public List<Inspeccion> listar() {
		return (List<Inspeccion>) dao.findAll();
	}

	@Override
	@Transactional
	public void guardar(Inspeccion inspeccion, int idVehiculo) {
		dtoIXV.guardar(new Inspecciones_x_Vehiculo(dao.save(inspeccion).getNumero(), idVehiculo));
	}

	@Override
	@Transactional
	public void eliminar(Inspeccion inspeccion) {
		dao.delete(inspeccion);
	}

	@Override
	@Transactional
	public void eliminar(Integer idInspeccion) {
		dao.deleteById(idInspeccion);
	}

	@Override
	@Transactional (readOnly = true)
	public Inspeccion buscar(Inspeccion inspeccion) {
		return buscar(inspeccion.getNumero());
	}

	@Override
	@Transactional (readOnly = true)
	public Inspeccion buscar(int numero) {
		return dao.findById(numero).orElse(null);
	}
	
	@Override
	@Transactional (readOnly = true)
	public ArrayList<Inspeccion> listarPorFecha(String fecha){
		ArrayList<Inspeccion> listaResultado = new ArrayList<Inspeccion>();
		for (Inspeccion inspeccion : dao.findAll()) {
			if (inspeccion.getFecha().toString().equals(fecha)) {
				listaResultado.add(inspeccion);
			}
		}
		return listaResultado;
	}

	@Override
	@Transactional (readOnly = true)
	public ArrayList<Inspeccion> listarPorPropietario(int dni) {
		ArrayList<Inspeccion> listaResultado = new ArrayList<Inspeccion>();
		int IDVehiculo = dtoVXP.buscar(dni).getId_vehiculo();
		for (Inspecciones_x_Vehiculo ixv : dtoIXV.buscar(IDVehiculo)) {
			listaResultado.add(buscar(ixv.getIdInspeccion()));
		}
		return listaResultado;
	}
}
