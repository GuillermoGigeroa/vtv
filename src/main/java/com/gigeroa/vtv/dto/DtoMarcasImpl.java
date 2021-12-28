package com.gigeroa.vtv.dto;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.dao.DaoMarcas;
import com.gigeroa.vtv.entities.MarcaVehiculo;
import com.gigeroa.vtv.repositories.DtoMarcas;

@Service
public class DtoMarcasImpl implements DtoMarcas{

	@Autowired
	private DaoMarcas dao;
	
	@Override
	@Transactional (readOnly = true)
	public List<MarcaVehiculo> listar() {
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
	public MarcaVehiculo buscar(MarcaVehiculo marca) {
		return buscar(marca.getIdMarca());
	}

	@Override
	@Transactional (readOnly = true)
	public MarcaVehiculo buscar(int IDMarca) {
		return dao.findById(IDMarca).orElse(null);
	}

}
