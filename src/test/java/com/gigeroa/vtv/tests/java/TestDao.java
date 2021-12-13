package com.gigeroa.vtv.tests.java;

import com.gigeroa.vtv.dao.*;
import junit.framework.TestCase;

public class TestDao extends TestCase{
	private DaoInspecciones daoInspeccion;
	private DaoInspectores daoInspectores;
	private DaoPropietarios daoPropietarios;
	private DaoVehiculos daoVehiculos;
	
//	Se generan escenarios previos a la ejecución de la prueba del DAO
	public void escenarioInspeccion () {
		daoInspeccion = new DaoInspecciones();
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
	
//	Se prueba el listar inspecciones del dao
	public void testListarInspecciones () {
		escenarioInspeccion();
		assertNotNull(daoInspeccion.listarInspecciones());
	}
	
//	Se prueba el listar propietarios del dao
	public void testListarPropietarios () {
		escenarioPropietarios();
		assertNotNull(daoPropietarios.listarPropietarios());
	}
	
//	Se prueba el listar inspectores del dao
	public void testListarInspectores () {
		escenarioInspectores();
		assertNotNull(daoInspectores.listarInspectores());
	}
	
//	Se prueba el listar vehículos del dao
	public void testListarVehiculos () {
		escenarioVehiculos();
		assertNotNull(daoVehiculos.listarVehiculos());
	}
}
