package com.gigeroa.vtv.dto;

import java.util.List;
import com.gigeroa.vtv.dao.DaoVehiculos;
import com.gigeroa.vtv.dao.DaoVehiculos_x_Propietario;
import com.gigeroa.vtv.entities.*;
import com.gigeroa.vtv.repositories.DtoVehiculos;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DtoVehiculosImpl implements DtoVehiculos {
	
	@Autowired
	DaoVehiculos dao;
	
	@Autowired
	DaoVehiculos_x_Propietario daoVXP;
	
	@Override
	@Transactional (readOnly = true)
	public List<Vehiculo> listar() {
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
	@Transactional
	public void eliminar(Integer idVehiculo) {
		dao.deleteById(idVehiculo);
	}

	@Override
	@Transactional (readOnly = true)
	public Vehiculo buscar(Vehiculo vehiculo) {
		return buscar(vehiculo.getID());
	}

	@Override
	@Transactional (readOnly = true)
	public Vehiculo buscar(int id) {
		return dao.findById(id).orElse(null);
	}

	@Override
	@Transactional (readOnly = true)
	public Vehiculo buscarPorPropietario(int dni) {
		for (Vehiculos_x_Propietario vxp : daoVXP.findAll()) {
			for (Vehiculo vehiculo : dao.findAll()) {
				if (vehiculo.getID() == vxp.getId_vehiculo() && vxp.getDni_propietario() == dni) {
					return vehiculo;
				}
			}
		}
		return null;
	}

	@Override
	@Transactional (readOnly = true)
	public Vehiculo buscarPorInspeccion(int inspeccion) {
		int idVehiculo = daoVXP.findById(inspeccion).orElse(null).getId_vehiculo();
		return dao.findById(idVehiculo).orElse(null);
	}

}
