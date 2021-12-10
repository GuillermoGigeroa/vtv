package com.gigeroa.vtv.tests;

import com.gigeroa.vtv.entities.*;
import com.gigeroa.vtv.repositories.*;
import com.gigeroa.vtv.services.*;
import junit.framework.TestCase;

public class TestServices extends TestCase {
	IControl medicion;
	IControl observacion;
	
//	Se generan escenarios previos a la ejecución de la prueba los services
	public void escenarioControlMedicion () {
		medicion = new Medicion(1);
	}

	public void escenarioControlObservacion () {
		observacion = new Observacion(1);
	}
	
//	Prueba del método getEstado de ControlServices con un IControl del tipo Medicion
	public void testControlService1 () {
		escenarioControlMedicion();
		assertTrue(ControlService.getEstado(medicion).compareTo(IEstado.apto) == 0);
	}

//	Prueba del método getEstado de ControlServices con un IControl del tipo Observacion
	public void testControlService2 () {
		escenarioControlObservacion();
		assertTrue(ControlService.getEstado(observacion).compareTo(IEstado.apto) == 0);
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
