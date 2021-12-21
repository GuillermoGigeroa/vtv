package com.gigeroa.vtv.dto;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.dao.DaoVehiculos_x_Propietario;
import com.gigeroa.vtv.entities.Vehiculos_x_Propietario;
import com.gigeroa.vtv.repositories.DtoVehiculos_x_Propietario;

public class DtoVehiculos_x_PropietarioImpl implements DtoVehiculos_x_Propietario{
	@Autowired
	DaoVehiculos_x_Propietario dao;
	
	@Override
	@Transactional (readOnly = true)
	public List<Vehiculos_x_Propietario> listar(){
		return (List<Vehiculos_x_Propietario>) dao.findAll();
	}

	@Override
	@Transactional
	public void guardar(Vehiculos_x_Propietario vxp) {
		dao.save(vxp);
	}

	@Override
	@Transactional
	public void eliminar(Vehiculos_x_Propietario vxp) {
		dao.delete(vxp);
	}

	@Override
	@Transactional (readOnly = true)
	public Vehiculos_x_Propietario encontrar(Vehiculos_x_Propietario vxp) {
		return dao.findById(vxp.getDni_propietario()).orElse(null);
	}

	@Override
	@Transactional (readOnly = true)
	public Vehiculos_x_Propietario encontrar(int dniPropietario) {
		return dao.findById(dniPropietario).orElse(null);
	}
}
