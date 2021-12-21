package com.gigeroa.vtv.dto;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.dao.DaoInspectores;
import com.gigeroa.vtv.entities.Inspector;
import com.gigeroa.vtv.repositories.DtoInspectores;

@Service
public class DtoInspectoresImpl implements DtoInspectores{

	@Autowired
	private DaoInspectores dao;
	
	@Override
	@Transactional (readOnly = true)
	public List<Inspector> listar() {
		return (List<Inspector>) dao.findAll();
	}

	@Override
	@Transactional
	public void guardar(Inspector inspector) {
		dao.save(inspector);
	}

	@Override
	@Transactional
	public void eliminar(Inspector inspector) {
		dao.delete(inspector);
	}

	@Override
	@Transactional (readOnly = true)
	public Inspector buscar(Inspector inspector) {
		return buscar(inspector.getLegajo());
	}

	@Override
	@Transactional (readOnly = true)
	public Inspector buscar(int legajo) {
		return dao.findById(legajo).orElse(null);
	}
}
