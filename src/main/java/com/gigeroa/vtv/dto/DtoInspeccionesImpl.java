package com.gigeroa.vtv.dto;

import com.gigeroa.vtv.dao.DaoInspecciones;
import com.gigeroa.vtv.entities.*;
import com.gigeroa.vtv.repositories.DtoInspecciones;
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

}
