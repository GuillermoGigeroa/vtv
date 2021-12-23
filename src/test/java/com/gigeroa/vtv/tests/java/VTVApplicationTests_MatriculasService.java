package com.gigeroa.vtv.tests.java;

import static org.junit.Assert.*;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import com.gigeroa.vtv.services.MatriculasService;

@RunWith(SpringRunner.class)
@SpringBootTest
public class VTVApplicationTests_MatriculasService {
	
	String patenteNueva;
	String patenteAntigua;

	public void escenario() {
		patenteNueva = "AA123AA";
		patenteAntigua = "AAA123";
	}
	
	@Test
	public void matriculaService_Nueva_Nueva () {
		escenario();
		assertTrue(MatriculasService.esNueva(patenteNueva));
	}
	
	@Test
	public void matriculaService_Nueva_Antigua () {
		escenario();
		assertFalse(MatriculasService.esNueva(patenteAntigua));
	}
	
	@Test
	public void matriculaService_Antigua_Antigua () {
		escenario();
		assertTrue(MatriculasService.esAntigua(patenteAntigua));
	}

	@Test
	public void matriculaService_Antigua_Nueva () {
		escenario();
		assertFalse(MatriculasService.esAntigua(patenteNueva));
	}
	
	@Test
	public void matriculaService_ProcesarMatricula_Nueva () {
		escenario();
		assertNotNull(MatriculasService.procesarMatricula(patenteNueva));
	}

	@Test
	public void matriculaService_ProcesarMatricula_Antigua () {
		escenario();
		assertNotNull(MatriculasService.procesarMatricula(patenteAntigua));
	}
	
	@Test
	public void matriculaService_ProcesarMatricula_Errores () {
		escenario();
		assertNull(MatriculasService.procesarMatricula("AAA"));
		assertNull(MatriculasService.procesarMatricula("123"));
		assertNull(MatriculasService.procesarMatricula("AA5A5JJ"));
		assertNull(MatriculasService.procesarMatricula("1AA123")); 
		assertNull(MatriculasService.procesarMatricula("AA123A5"));
		assertNull(MatriculasService.procesarMatricula("AAA12A"));
		assertNull(MatriculasService.procesarMatricula("A123AAA"));
	}
	
	@Test
	public void matriculaService_EsTexto_Antigua () {
		escenario();
		// Formato AAA123
		assertTrue(MatriculasService.esTexto(patenteAntigua.substring(0,3)));
	}
	
	@Test
	public void matriculaService_EsTexto_Nueva () {
		escenario();
		// Formato AA123AA
		assertTrue(MatriculasService.esTexto(patenteNueva.substring(0,2)));
		assertTrue(MatriculasService.esTexto(patenteNueva.substring(5)));
	}

}
