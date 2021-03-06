package com.gigeroa.vtv.dto;

import com.gigeroa.vtv.dao.DaoPropietarios;
import com.gigeroa.vtv.dao.DaoVehiculos_x_Propietario;
import com.gigeroa.vtv.entities.*;
import com.gigeroa.vtv.repositories.DtoPropietarios;

import java.util.List;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DtoPropietariosImpl implements DtoPropietarios {
	
	@Autowired
	DaoPropietarios dao;
	
	@Autowired
	DaoVehiculos_x_Propietario daoVXP;
	
	@Override
	@Transactional (readOnly = true)
	public List<Propietario> listar() {
		return (List<Propietario>) dao.findAll();
	}

	@Override
	@Transactional
	public void guardar(Propietario propietario) {
		dao.save(propietario);
	}

	@Override
	@Transactional
	public void eliminar(Propietario propietario) {
		dao.delete(propietario);
	}
	
	@Override
	@Transactional
	public void eliminar(Integer dni) {
		dao.deleteById(dni);;
	}

	@Override
	@Transactional (readOnly = true)
	public Propietario buscar(Propietario propietario) {
		return buscar(propietario.getDni());
	}

	@Override
	@Transactional (readOnly = true)
	public Propietario buscar(int dni) {
		return dao.findById(dni).orElse(null);
	}

	@Override
	@Transactional (readOnly = true)
	public Propietario buscarPorVehiculo(int id) {
		for (Vehiculos_x_Propietario vxp : daoVXP.findAll()) {
			for (Propietario propietario : dao.findAll()) {
				if (propietario.getDni() == vxp.getDni_propietario() && vxp.getId_vehiculo() == id) {
					return propietario;
				}
			}
		}
		return null;
	}
}
