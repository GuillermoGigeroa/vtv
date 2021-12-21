package com.gigeroa.vtv.dto;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.dao.DaoInspecciones_x_Vehiculo;
import com.gigeroa.vtv.entities.Inspecciones_x_Vehiculo;
import com.gigeroa.vtv.repositories.DtoInpecciones_x_Vehiculo;

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
	public ArrayList<Inspecciones_x_Vehiculo> encontrar(Inspecciones_x_Vehiculo ixv) {
		return encontrar(ixv.getIdVehiculo());
	}
	
	@Override
	@Transactional (readOnly = true)
	public ArrayList<Inspecciones_x_Vehiculo> encontrar(int idVehiculo) {
		ArrayList<Inspecciones_x_Vehiculo> lista = new ArrayList<Inspecciones_x_Vehiculo>();
		for (Inspecciones_x_Vehiculo i : dao.findAll()) {
			if (i.getIdVehiculo() == idVehiculo) {
				lista.add(i);
			}
		}
		return lista;
	}
}
