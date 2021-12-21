package com.gigeroa.vtv.dto;

import com.gigeroa.vtv.dao.DaoPropietarios;
import com.gigeroa.vtv.dao.DaoVehiculos_x_Propietario;
import com.gigeroa.vtv.entities.*;
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
	public List<Propietario> listarPropietarios() {
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
	@Transactional (readOnly = true)
	public Propietario encontrarPropietario(Propietario propietario) {
		return dao.findById(propietario.getDni()).orElse(null);
	}

	@Override
	@Transactional (readOnly = true)
	public Propietario encontrarPropietario(int dni) {
		return dao.findById(dni).orElse(null);
	}

	@Override
	public Propietario buscarPorVehiculo(int id) {
		for (Vehiculos_x_Propietario vxp : daoVXP.findAll()) {
			for (Propietario propietario : dao.findAll()) {
				if (propietario.getDni() == vxp.getDni_propietario()) {
					return propietario;
				}
			}
		}
		return null;
	}
}
