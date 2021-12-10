package com.gigeroa.vtv.tests;

import com.gigeroa.vtv.dao.DaoInspeccion;
import com.gigeroa.vtv.dao.DaoInspectores;
import com.gigeroa.vtv.dao.DaoPropietarios;
import com.gigeroa.vtv.dao.DaoVehiculos;

import junit.framework.TestCase;

public class TestDto extends TestCase{
	private DaoInspeccion daoInspeccion;
	private DaoInspectores daoInspectores;
	private DaoPropietarios daoPropietarios;
	private DaoVehiculos daoVehiculos;
	
	public void escenarioInspeccion () {
		daoInspeccion = new DaoInspeccion();
	}
	public void escenarioInspectores () {
		daoInspectores = new DaoInspectores();
	}
	public void escenarioPropietarios () {
		daoPropietarios = new DaoPropietarios();
	}
	public void escenarioVehiculos () {
		daoVehiculos = new DaoVehiculos();
	}
	
	public void testListarInspecciones () {
		escenarioInspeccion();
		assertNotNull(daoInspeccion.listarInspecciones());
	}
	
	public void testListarPropietarios () {
		escenarioPropietarios();
		assertNotNull(daoPropietarios.listarPropietarios());
	}
	
	public void testListarInspectores () {
		escenarioInspectores();
		assertNotNull(daoInspectores.listarInspectores());
	}
	
	public void testListarVehiculos () {
		escenarioVehiculos();
		assertNotNull(daoVehiculos.listarVehiculos());
	}
}
