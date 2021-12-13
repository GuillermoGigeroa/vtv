package com.gigeroa.vtv.tests;

import com.gigeroa.vtv.entities.*;
import com.gigeroa.vtv.repositories.*;
import com.gigeroa.vtv.services.*;
import junit.framework.TestCase;

public class TestEstadosService extends TestCase {
	IControl medicion;
	IControl observacion;
	
//	Se generan escenarios previos a la ejecución de la prueba del servicio
	public void escenarioControlMedicion () {
		medicion = new Medicion(1);
	}

	public void escenarioControlObservacion () {
		observacion = new Observacion(1);
	}
	
//	Prueba del método numeroEstado de EstadosServices con un IControl del tipo Observacion
	public void testEstadosService1 () {
		escenarioControlObservacion();
		assertTrue(EstadosService.numeroEstado(observacion.toString()) == 1);
	}
	
//	Prueba del método numeroEstado de EstadosServices con un IControl del tipo Medicion
	public void testEstadosService2 () {
		escenarioControlMedicion();
		assertTrue(EstadosService.numeroEstado(medicion.toString()) == 1);
	}
}
