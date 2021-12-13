package com.gigeroa.vtv.tests;

import com.gigeroa.vtv.services.MatriculasService;
import junit.framework.TestCase;

public class TestMatriculasService extends TestCase {
	String patenteNueva;
	String patenteAntigua;
//	Se generan escenarios previos a la ejecución de la prueba del servicio
	public void escenario() {
		patenteNueva = "AA123AA";
		patenteAntigua = "AAA123";
	}
	
	public void testEsNueva_Nueva () {
		escenario();
		assertTrue(MatriculasService.esNueva(patenteNueva));
	}
	
	public void testEsNueva_Antigua () {
		escenario();
		assertFalse(MatriculasService.esNueva(patenteAntigua));
	}
	
	public void testEsAntigua_Antigua () {
		escenario();
		assertTrue(MatriculasService.esAntigua(patenteAntigua));
	}

	public void testEsAntigua_Nueva () {
		escenario();
		assertFalse(MatriculasService.esAntigua(patenteNueva));
	}
	
	public void testProcesarMatricula_Nueva () {
		escenario();
		assertNotNull(MatriculasService.procesarMatricula(patenteNueva));
	}

	public void testProcesarMatricula_Antigua () {
		escenario();
		assertNotNull(MatriculasService.procesarMatricula(patenteAntigua));
	}
	
	public void testProcesarMatricula_Errores () {
		escenario();
		assertNull(MatriculasService.procesarMatricula("AAA"));
		assertNull(MatriculasService.procesarMatricula("123"));
		assertNull(MatriculasService.procesarMatricula("AA5A5JJ"));
		assertNull(MatriculasService.procesarMatricula("1AA123")); 
		assertNull(MatriculasService.procesarMatricula("AA123A5"));
		assertNull(MatriculasService.procesarMatricula("AAA12A"));
		assertNull(MatriculasService.procesarMatricula("A123AAA"));
	}
	
	public void testEsTexto_Antigua () {
		escenario();
		// Formato AAA123
		assertTrue(MatriculasService.esTexto(patenteAntigua.substring(0,3)));
	}
	
	public void testEsTexto_Nueva () {
		escenario();
		// Formato AA123AA
		assertTrue(MatriculasService.esTexto(patenteNueva.substring(0,2)));
		assertTrue(MatriculasService.esTexto(patenteNueva.substring(5)));
	}
}
