package com.gigeroa.vtv.dto;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.dao.DaoMarcas;
import com.gigeroa.vtv.entities.MarcaVehiculo;

@Service
public class DtoMarcasImpl implements DtoMarcas{

	@Autowired
	private DaoMarcas dao;
	
	@Override
	@Transactional (readOnly = true)
	public List<MarcaVehiculo> listarMarcas() {
		return (List<MarcaVehiculo>) dao.findAll();
	}

	@Override
	@Transactional
	public void guardar(MarcaVehiculo marca) {
		dao.save(marca);
	}

	@Override
	@Transactional
	public void eliminar(MarcaVehiculo marca) {
		dao.delete(marca);
	}

	@Override
	@Transactional (readOnly = true)
	public MarcaVehiculo encontrarMarca(MarcaVehiculo marca) {
		return dao.findById(marca.getID()).orElse(null);
	}

	@Override
	@Transactional (readOnly = true)
	public MarcaVehiculo encontrarMarca(int IDMarca) {
		return dao.findById(IDMarca).orElse(null);
	}

}