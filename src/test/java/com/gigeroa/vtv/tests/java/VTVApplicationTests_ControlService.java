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
import com.gigeroa.vtv.services.ControlService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class VTVApplicationTests_ControlService {
	
	IControl medicion;
	IControl observacion;
	
	@Test
	public void controlService_Medicion() {
		//Escenario
		medicion = new Medicion(1);
		
		//Situación
		int resultado = ControlService.getEstado(medicion).compareTo(IEstado.apto);
		
		//Resultado esperado
		assertEquals(0, resultado);
	}

	@Test
	public void controlService_Observacion() {
		//Escenario
		observacion = new Observacion(1);
		
		//Situación
		int resultado = ControlService.getEstado(observacion).compareTo(IEstado.apto);
		
		//Resultado esperado
		assertEquals(0, resultado);
	}
}
