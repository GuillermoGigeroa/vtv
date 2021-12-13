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
	
	public void testEsNueva1 () {
		escenario();
		assertTrue(MatriculasService.esNueva(patenteNueva));
	}
	
	public void testEsNueva2 () {
		escenario();
		assertFalse(MatriculasService.esNueva(patenteAntigua));
	}
	
	public void testEsAntigua1 () {
		escenario();
		assertTrue(MatriculasService.esAntigua(patenteAntigua));
	}

	public void testEsAntigua2 () {
		escenario();
		assertFalse(MatriculasService.esAntigua(patenteNueva));
	}
	
	public void testProcesarMatricula1 () {
		escenario();
		assertNotNull(MatriculasService.procesarMatricula(patenteNueva));
	}

	public void testProcesarMatricula2 () {
		escenario();
		assertNotNull(MatriculasService.procesarMatricula(patenteAntigua));
	}

	public void testProcesarMatricula3 () {
		escenario();
		assertNull(MatriculasService.procesarMatricula("AAA"));
		assertNull(MatriculasService.procesarMatricula("123"));
		assertNull(MatriculasService.procesarMatricula("AA5A5JJ"));
//		assertNull(MatriculasService.procesarMatricula("1AA123")); TODO Revisar este caso. Ver letras
//		assertNull(MatriculasService.procesarMatricula("AA123A5")); TODO Revisar este caso. Ver letras
		assertNull(MatriculasService.procesarMatricula("AAA12A"));
		assertNull(MatriculasService.procesarMatricula("A123AAA"));
	}
}
