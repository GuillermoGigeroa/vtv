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
	
	IControl medicion;
	IControl observacion;
	
	@Test
	public void estadosService_estadoToNumero() {
		assertEquals(IEstado.aptoNumero, EstadosService.estadoToNumero(IEstado.apto));
		assertEquals(IEstado.condicionalNumero, EstadosService.estadoToNumero(IEstado.condicional));
		assertEquals(IEstado.rechazadoNumero, EstadosService.estadoToNumero(IEstado.rechazado));
	}

	@Test
	public void estadosService_estadoToNumeroObservacion() {
		observacion = new Observacion(IEstado.aptoNumero);
		assertEquals(IEstado.aptoNumero, EstadosService.estadoToNumero(observacion.toString()));
		
		observacion = new Observacion(IEstado.condicionalNumero);
		assertEquals(IEstado.condicionalNumero, EstadosService.estadoToNumero(observacion.toString()));
		
		observacion = new Observacion(IEstado.rechazadoNumero);
		assertEquals(IEstado.rechazadoNumero, EstadosService.estadoToNumero(observacion.toString()));
	}

	@Test
	public void estadosService_estadoToNumeroMedicion() {
		medicion = new Medicion(IEstado.aptoNumero);
		assertEquals(IEstado.aptoNumero, EstadosService.estadoToNumero(medicion.toString()));
		
		medicion = new Medicion(IEstado.condicionalNumero);
		assertEquals(IEstado.condicionalNumero, EstadosService.estadoToNumero(medicion.toString()));
		
		medicion = new Medicion(IEstado.rechazadoNumero);
		assertEquals(IEstado.rechazadoNumero, EstadosService.estadoToNumero(medicion.toString()));
	}

	@Test
	public void estadosService_numeroToEstado() {
		assertEquals(IEstado.apto, EstadosService.numeroToEstado(IEstado.aptoNumero));
		assertEquals(IEstado.condicional, EstadosService.numeroToEstado(IEstado.condicionalNumero));
		assertEquals(IEstado.rechazado, EstadosService.numeroToEstado(IEstado.rechazadoNumero));
	}
}
