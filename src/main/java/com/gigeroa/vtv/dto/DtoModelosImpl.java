package com.gigeroa.vtv.dto;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.dao.DaoModelos;
import com.gigeroa.vtv.dao.DaoVehiculos;
import com.gigeroa.vtv.entities.ModeloVehiculo;
import com.gigeroa.vtv.repositories.DtoModelos;

@Service
public class DtoModelosImpl implements DtoModelos{

	@Autowired
	private DaoModelos dao;
	
	@Override
	@Transactional (readOnly = true)
	public List<ModeloVehiculo> listar() {
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
	public ModeloVehiculo buscar(ModeloVehiculo modelo) {
		return buscar(modelo.getID());
	}

	@Override
	@Transactional (readOnly = true)
	public ModeloVehiculo buscar(int IDModelo) {
		return dao.findById(IDModelo).orElse(null);
	}
	
	@Transactional (readOnly = true)
	public List<ModeloVehiculo> listarModelosPorMarca (int ID_Marca) {
		return (new DaoVehiculos()).listarModelos(ID_Marca);
	}

}
