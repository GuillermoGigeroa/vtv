package com.gigeroa.vtv.dto;

import java.util.List;
import com.gigeroa.vtv.dao.DaoVehiculos2;
import com.gigeroa.vtv.entities.*;
import com.gigeroa.vtv.repositories.DtoVehiculos;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DtoVehiculosImpl implements DtoVehiculos {
	
	@Autowired
	DaoVehiculos2 dao;
	
	@Override
	@Transactional (readOnly = true)
	public List<Vehiculo> listarVehiculos() {
		return (List<Vehiculo>) dao.findAll();
	}

	@Override
	@Transactional
	public void guardar(Vehiculo vehiculo) {
		dao.save(vehiculo);
	}

	@Override
	@Transactional
	public void eliminar(Vehiculo vehiculo) {
		dao.delete(vehiculo);
	}

	@Override
	@Transactional (readOnly = true)
	public Vehiculo encontrarVehiculo(Vehiculo vehiculo) {
		return dao.findById(vehiculo.getID()).orElse(null);
	}

	@Override
	@Transactional (readOnly = true)
	public Vehiculo encontrarVehiculo(int id) {
		return dao.findById(id).orElse(null);
	}

}
