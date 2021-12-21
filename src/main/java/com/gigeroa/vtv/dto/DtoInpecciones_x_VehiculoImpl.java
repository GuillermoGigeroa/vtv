package com.gigeroa.vtv.dto;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.dao.DaoInspecciones_x_Vehiculo;
import com.gigeroa.vtv.entities.Inspecciones_x_Vehiculo;

public class DtoInpecciones_x_VehiculoImpl implements DtoInpecciones_x_Vehiculo{
	@Autowired
	DaoInspecciones_x_Vehiculo dao;
	
	@Override
	@Transactional (readOnly = true)
	public List<Inspecciones_x_Vehiculo> listar() {
		return (List<Inspecciones_x_Vehiculo>) dao.findAll();
	}
	
	@Override
	@Transactional
	public void guardar (Inspecciones_x_Vehiculo ixv) {
		dao.save(ixv);
	}

	@Override
	@Transactional
	public void eliminar (Inspecciones_x_Vehiculo ixv) {
		dao.delete(ixv);
	}
	
	@Override
	@Transactional (readOnly = true)
	public Inspecciones_x_Vehiculo encontrar(Inspecciones_x_Vehiculo ixv) {
		return dao.findById(ixv.getIdInspeccion()).orElse(null);
	}
	
	@Override
	@Transactional (readOnly = true)
	public Inspecciones_x_Vehiculo encontrar(int idInspeccion) {
		return dao.findById(idInspeccion).orElse(null);
	}
}
