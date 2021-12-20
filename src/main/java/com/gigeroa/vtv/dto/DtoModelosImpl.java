package com.gigeroa.vtv.dto;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.dao.DaoModelos;
import com.gigeroa.vtv.entities.ModeloVehiculo;

@Service
public class DtoModelosImpl implements DtoModelos{

	@Autowired
	private DaoModelos dao;
	
	@Override
	@Transactional (readOnly = true)
	public List<ModeloVehiculo> listarModelos() {
		return (List<ModeloVehiculo>) dao.findAll();
	}

	@Override
	@Transactional
	public void guardar(ModeloVehiculo modelo) {
		dao.save(modelo);
	}

	@Override
	@Transactional
	public void eliminar(ModeloVehiculo modelo) {
		dao.delete(modelo);
	}

	@Override
	@Transactional (readOnly = true)
	public ModeloVehiculo encontrarModelo(ModeloVehiculo modelo) {
		return dao.findById(modelo.getID()).orElse(null);
	}

	@Override
	@Transactional (readOnly = true)
	public ModeloVehiculo encontrarModelo(int IDModelo) {
		return dao.findById(IDModelo).orElse(null);
	}

}
