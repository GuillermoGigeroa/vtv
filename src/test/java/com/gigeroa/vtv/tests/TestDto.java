package com.gigeroa.vtv.tests;

import com.gigeroa.vtv.dto.*;
import junit.framework.TestCase;

public class TestDto extends TestCase{
	private DtoInspecciones dtoInspeccion;
	private DtoInspectores dtoInspectores;
	private DtoPropietarios dtoPropietarios;
	private DtoVehiculos dtoVehiculos;
	
//	Se generan escenarios previos a la ejecución de la prueba del DTO
	public void escenarioInspeccion () {
		dtoInspeccion = new DtoInspecciones();
	}
	
	public void escenarioInspectores () {
		dtoInspectores = new DtoInspectores();
	}
	
	public void escenarioPropietarios () {
		dtoPropietarios = new DtoPropietarios();
	}
	
	public void escenarioVehiculos () {
		dtoVehiculos = new DtoVehiculos();
	}
	
//	Se prueba el listar inspecciones del dto
	public void testListarInspecciones () {
		escenarioInspeccion();
		assertNotNull(dtoInspeccion.listarInspecciones());
	}

//	Se prueba el listar propietarios del dto
	public void testListarPropietarios () {
		escenarioPropietarios();
		assertNotNull(dtoPropietarios.listarPropietarios());
	}
	
//	Se prueba el listar inspectores del dto
	public void testListarInspectores () {
		escenarioInspectores();
		assertNotNull(dtoInspectores.listarInspectores());
	}
	
//	Se prueba el listar vehículos del dto
	public void testListarVehiculos () {
		escenarioVehiculos();
		assertNotNull(dtoVehiculos.listarVehiculos());
	}
}
