package com.gigeroa.vtv.dto;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.gigeroa.vtv.dao.DaoModelos;
import com.gigeroa.vtv.dao.DaoModelos_x_Marca;
import com.gigeroa.vtv.entities.ModeloVehiculo;
import com.gigeroa.vtv.entities.Modelos_x_Marca;
import com.gigeroa.vtv.repositories.DtoModelos;

@Service
public class DtoModelosImpl implements DtoModelos{

	@Autowired
	private DaoModelos dao;

	@Autowired
	private DaoModelos_x_Marca daoMXM;

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
		return buscar(modelo.getIdModelo());
	}

	@Override
	@Transactional (readOnly = true)
	public ModeloVehiculo buscar(int IDModelo) {
		return dao.findById(IDModelo).orElse(null);
	}
	
	@Override
	@Transactional (readOnly = true)
	public ArrayList<ModeloVehiculo> listarModelosPorMarca (int ID_Marca) {
		Iterable<Modelos_x_Marca> listaMXM = daoMXM.findAll();
		ArrayList<ModeloVehiculo> resultado = new ArrayList<ModeloVehiculo>();
		for (Modelos_x_Marca mxm : listaMXM) {
			if (mxm.getIdMarca() == ID_Marca) {
				resultado.add(buscar(mxm.getIdModelo()));
			}
		}
		return resultado;
	}

}
