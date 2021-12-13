package com.gigeroa.vtv.tests;

import com.gigeroa.vtv.services.DniService;
import junit.framework.TestCase;

public class TestDniService extends TestCase{
	private String dni;
	
//	Se crean varios escenarios posibles en el caso de ingreso de DNI
	public void escenarioDniValido1 () {
		dni = "93300412";
	}

	public void escenarioDniValido2 () {
		dni = "1234567";
	}

	public void escenarioDniInvalido1 () {
		dni = "187F5482";
	}

	public void escenarioDniInvalido2 () {
		dni = "hola12345";
	}
	
//	Prueba sobre un caso válido
	public void testVerificar_Valido1 () {
		escenarioDniValido1();
		assertTrue(DniService.verificarDniInvalido(dni));
	}

//	Prueba sobre un caso válido
	public void testVerificar_Valido2 () {
		escenarioDniValido2();
		assertTrue(DniService.verificarDniInvalido(dni));
	}
	
//	Prueba sobre un caso inválido
	public void testVerificar_Invalido1 () {
		escenarioDniInvalido1();
		assertFalse(DniService.verificarDniInvalido(dni));
	}

//	Prueba sobre un caso inválido
	public void testVerificar_Invalido2 () {
		escenarioDniInvalido2();
		assertFalse(DniService.verificarDniInvalido(dni));
	}
	
}
