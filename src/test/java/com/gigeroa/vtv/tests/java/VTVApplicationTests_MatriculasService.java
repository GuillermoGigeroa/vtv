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
	
	final String patenteNueva = "AA123AA";
	final String patenteAntigua = "AAA123";

	@Test
	public void matriculaService_Nueva_Nueva () {
		assertTrue(MatriculasService.esNueva(patenteNueva));
	}
	
	@Test
	public void matriculaService_Nueva_Antigua () {
		assertFalse(MatriculasService.esNueva(patenteAntigua));
	}
	
	@Test
	public void matriculaService_Antigua_Antigua () {
		assertTrue(MatriculasService.esAntigua(patenteAntigua));
	}

	@Test
	public void matriculaService_Antigua_Nueva () {
		assertFalse(MatriculasService.esAntigua(patenteNueva));
	}
	
	@Test
	public void matriculaService_ProcesarMatricula_Nueva () {
		assertNotNull(MatriculasService.procesarMatricula(patenteNueva));
	}

	@Test
	public void matriculaService_ProcesarMatricula_Antigua () {
		assertNotNull(MatriculasService.procesarMatricula(patenteAntigua));
	}
	
	@Test
	public void matriculaService_ProcesarMatricula_Errores () {
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
		// Formato AAA123
		assertTrue(MatriculasService.esTexto(patenteAntigua.substring(0,3)));
	}
	
	@Test
	public void matriculaService_EsTexto_Nueva () {
		// Formato AA123AA
		assertTrue(MatriculasService.esTexto(patenteNueva.substring(0,2)));
		assertTrue(MatriculasService.esTexto(patenteNueva.substring(5)));
	}

}
