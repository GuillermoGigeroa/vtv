package com.gigeroa.vtv.tests.java;

import static org.junit.Assert.*;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import com.gigeroa.vtv.services.DniService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class VTVApplicationTests_DniService {
	
	private String dni;
	
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
	
	@Test
	public void DniService_valido1() {
		escenarioDniValido1();
		assertTrue(DniService.verificarDniInvalido(dni));
	}

	@Test
	public void DniService_valido2() {
		escenarioDniValido2();
		assertTrue(DniService.verificarDniInvalido(dni));
	}

	@Test
	public void DniService_invalido1() {
		escenarioDniInvalido1();
		assertFalse(DniService.verificarDniInvalido(dni));
	}
	
	@Test
	public void DniService_invalido2() {
		escenarioDniInvalido2();
		assertFalse(DniService.verificarDniInvalido(dni));
	}

}
