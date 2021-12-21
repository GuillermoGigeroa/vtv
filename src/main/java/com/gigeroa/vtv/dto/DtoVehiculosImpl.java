package com.gigeroa.vtv.dto;

import java.util.List;
import com.gigeroa.vtv.dao.DaoVehiculos2;
import com.gigeroa.vtv.dao.DaoVehiculos_x_Propietario;
import com.gigeroa.vtv.entities.*;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DtoVehiculosImpl implements DtoVehiculos {
	
	@Autowired
	DaoVehiculos2 dao;
	
	@Autowired
	DaoVehiculos_x_Propietario daoVXP;
	
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

	@Override
	@Transactional (readOnly = true)
	public Vehiculo buscarPorPropietario(int dni) {
		for (Vehiculos_x_Propietario vxp : daoVXP.findAll()) {
			for (Vehiculo vehiculo : dao.findAll()) {
				if (vehiculo.getID() == vxp.getId_vehiculo()) {
					return vehiculo;
				}
			}
		}
		return null;
	}

}
