package com.gigeroa.vtv.tests.java;

import static org.junit.Assert.*;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import com.gigeroa.vtv.entities.Medicion;
import com.gigeroa.vtv.entities.Observacion;
import com.gigeroa.vtv.repositories.IControl;
import com.gigeroa.vtv.services.EstadosService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class VTVApplicationTests_EstadosService {
	
	IControl medicion;
	IControl observacion;
	
	@Test
	public void estadosService_Observacion () {
		final int tipoEstado = 1;
		Observacion observacion = new Observacion(tipoEstado);
		assertEquals(tipoEstado, EstadosService.estadoToNumero(observacion.toString()));
	}
	
	@Test
	public void estadosService_Medicion () {
		final int tipoEstado = 1;
		medicion = new Medicion(tipoEstado);
		assertEquals(tipoEstado, EstadosService.estadoToNumero(medicion.toString()));
	}

}
