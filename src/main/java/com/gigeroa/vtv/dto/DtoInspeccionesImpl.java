package com.gigeroa.vtv.dto;

import com.gigeroa.vtv.dao.DaoInspecciones;
import com.gigeroa.vtv.entities.*;

import java.util.ArrayList;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DtoInspeccionesImpl implements DtoInspecciones {
	
	@Autowired
	DaoInspecciones dao;
	
	@Override
	@Transactional (readOnly = true)
	public List<Inspeccion> listarInspecciones() {
		return (List<Inspeccion>) dao.findAll();
	}

	@Override
	@Transactional
	public void guardar(Inspeccion inspeccion) {
		dao.save(inspeccion);
	}

	@Override
	@Transactional
	public void eliminar(Inspeccion inspeccion) {
		dao.delete(inspeccion);
	}

	@Override
	@Transactional (readOnly = true)
	public Inspeccion encontrarInspeccion(Inspeccion inspeccion) {
		return dao.findById(inspeccion.getNumero()).orElse(null);
	}
	
	@Override
	@Transactional (readOnly = true)
	public ArrayList<Inspeccion> listarInspeccionesPorFecha(String fecha){
		ArrayList<Inspeccion> listaResultado = new ArrayList<Inspeccion>();
		for (Inspeccion inspeccion : dao.findAll()) {
			if (inspeccion.getFecha().toString().equals(fecha)) {
				listaResultado.add(inspeccion);
			}
		}
		return listaResultado;
	}

	@Override
	public ArrayList<Inspeccion> listarInspeccionesPorPropietario(int dni) {
		// TODO Para realizar
		return null;
	}
}
