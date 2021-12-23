package com.gigeroa.vtv.tests.java;

import static org.junit.Assert.*;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.gigeroa.vtv.entities.Medicion;
import com.gigeroa.vtv.entities.Observacion;
import com.gigeroa.vtv.repositories.IControl;
import com.gigeroa.vtv.repositories.IEstado;
import com.gigeroa.vtv.services.EstadosService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class VTVApplicationTests_EstadosService {
	
	final String aptoString = IEstado.apto;
	final String condicionalString = IEstado.condicional;
	final String rechazadoString = IEstado.rechazado;
	final int aptoNumero = 1;
	final int condicionalNumero = 2;
	final int rechazadoNumero = 3;
	IControl medicion;
	IControl observacion;
	
	@Test
	public void estadosService_estadoToNumero() {
		assertEquals(aptoNumero, EstadosService.estadoToNumero(aptoString));
		assertEquals(condicionalNumero, EstadosService.estadoToNumero(condicionalString));
		assertEquals(rechazadoNumero, EstadosService.estadoToNumero(rechazadoString));
	}

	@Test
	public void estadosService_estadoToNumeroObservacion() {
		observacion = new Observacion(aptoNumero);
		assertEquals(aptoNumero, EstadosService.estadoToNumero(observacion.toString()));
		
		observacion = new Observacion(condicionalNumero);
		assertEquals(condicionalNumero, EstadosService.estadoToNumero(observacion.toString()));
		
		observacion = new Observacion(rechazadoNumero);
		assertEquals(rechazadoNumero, EstadosService.estadoToNumero(observacion.toString()));
	}

	@Test
	public void estadosService_estadoToNumeroMedicion() {
		medicion = new Medicion(aptoNumero);
		assertEquals(aptoNumero, EstadosService.estadoToNumero(medicion.toString()));
		
		medicion = new Medicion(condicionalNumero);
		assertEquals(condicionalNumero, EstadosService.estadoToNumero(medicion.toString()));
		
		medicion = new Medicion(rechazadoNumero);
		assertEquals(rechazadoNumero, EstadosService.estadoToNumero(medicion.toString()));
	}

	@Test
	public void estadosService_numeroToEstado() {
		assertEquals(aptoString, EstadosService.numeroToEstado(aptoNumero));
		assertEquals(condicionalString, EstadosService.numeroToEstado(condicionalNumero));
		assertEquals(rechazadoString, EstadosService.numeroToEstado(rechazadoNumero));
	}
}
