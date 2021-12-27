package com.gigeroa.vtv.tests.services;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import com.gigeroa.vtv.entities.Medicion;
import com.gigeroa.vtv.entities.Observacion;
import com.gigeroa.vtv.repositories.IControl;
import com.gigeroa.vtv.repositories.IEstado;
import com.gigeroa.vtv.services.ControlService;

@SpringBootTest
public class VTVApplicationTests_ControlService {
	
	IControl medicion;
	IControl observacion;
	
	@Test
	public void controlService_MedicionApto() {
		medicion = new Medicion(IEstado.aptoNumero);
		assertEquals(0, ControlService.getEstado(medicion).compareTo(IEstado.apto));
	}

	@Test
	public void controlService_MedicionCondicional() {
		medicion = new Medicion(IEstado.condicionalNumero);
		assertEquals(0, ControlService.getEstado(medicion).compareTo(IEstado.condicional));
	}

	@Test
	public void controlService_MedicionRechazado() {
		medicion = new Medicion(IEstado.rechazadoNumero);
		assertEquals(0, ControlService.getEstado(medicion).compareTo(IEstado.rechazado));
	}

	@Test
	public void controlService_ObservacionApto() {
		observacion = new Observacion(IEstado.aptoNumero);
		assertEquals(0, ControlService.getEstado(observacion).compareTo(IEstado.apto));
	}

	@Test
	public void controlService_ObservacionCondicional() {
		observacion = new Observacion(IEstado.condicionalNumero);
		assertEquals(0, ControlService.getEstado(observacion).compareTo(IEstado.condicional));
	}

	@Test
	public void controlService_ObservacionRechazado() {
		observacion = new Observacion(IEstado.rechazadoNumero);
		assertEquals(0, ControlService.getEstado(observacion).compareTo(IEstado.rechazado));
	}
}
