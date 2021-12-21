package com.gigeroa.vtv.dto;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.dao.DaoModelos_x_Marca;
import com.gigeroa.vtv.entities.Modelos_x_Marca;
import com.gigeroa.vtv.repositories.DtoModelos_x_Marca;

public class DtoModelos_x_MarcaImpl implements DtoModelos_x_Marca {

	@Autowired
	DaoModelos_x_Marca dao;
	
	@Override
	@Transactional (readOnly = true)
	public List<Modelos_x_Marca> listar() {
		return (List<Modelos_x_Marca>) dao.findAll();
	}

	@Override
	@Transactional
	public void guardar(Modelos_x_Marca mxm) {
		dao.save(mxm);
	}

	@Override
	@Transactional
	public void eliminar(Modelos_x_Marca mxm) {
		dao.delete(mxm);
	}

	@Override
	@Transactional (readOnly = true)
	public Modelos_x_Marca encontrar(Modelos_x_Marca mxm) {
		return dao.findById(mxm.getIdMarca()).orElse(null);
	}

	@Override
	@Transactional (readOnly = true)
	public Modelos_x_Marca encontrar(int idMarca) {
		return dao.findById(idMarca).orElse(null);
	}

}
