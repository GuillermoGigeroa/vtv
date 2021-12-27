package com.gigeroa.vtv.tests.services;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.when;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.springframework.boot.test.context.SpringBootTest;
import com.gigeroa.vtv.dto.DtoInspectoresImpl;
import com.gigeroa.vtv.dto.DtoPropietariosImpl;
import com.gigeroa.vtv.entities.Inspector;
import com.gigeroa.vtv.entities.Propietario;
import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.services.DniService;

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
	public void dniService_valido1() {
		escenarioDniValido1();
		assertTrue(DniService.verificarDniInvalido(dni));
	}

	@Test
	public void dniService_valido2() {
		escenarioDniValido2();
		assertTrue(DniService.verificarDniInvalido(dni));
	}

	@Test
	public void dniService_invalido1() {
		escenarioDniInvalido1();
		assertFalse(DniService.verificarDniInvalido(dni));
	}
	
	@Test
	public void dniService_invalido2() {
		escenarioDniInvalido2();
		assertFalse(DniService.verificarDniInvalido(dni));
	}
	
	@Mock
	DtoPropietariosImpl dtoPropietarios;
	
	@Test
	public void dniService_existeDniPropietario_encontrado() throws DniInvalido {
		int dni = 11111111;
		
		Propietario propietario = new Propietario(dni,"Nombre","Apellido",false);
		when(dtoPropietarios.buscar(dni)).thenReturn(propietario);
		
		assertTrue(DniService.existeDniPropietario(dni,dtoPropietarios));
	}

	@Test
	public void dniService_existeDniPropietario_no_encontrado() throws DniInvalido {
		int dni = 11111111;
		
		when(dtoPropietarios.buscar(dni)).thenReturn(null);
		
		assertFalse(DniService.existeDniPropietario(dni,dtoPropietarios));
	}

	@Mock
	DtoInspectoresImpl dtoInspectores;
	
	@Test
	public void dniService_existeDniInspector_encontrado() throws DniInvalido {
		int dni = 11111111;

		Inspector inspector = new Inspector(56987,dni,"Nombre","Apellido");
		when(dtoInspectores.buscar(dni)).thenReturn(inspector);
		
		assertTrue(DniService.existeDniInspector(dni,dtoInspectores));
	}

	@Test
	public void dniService_existeDniInspector_no_encontrado() throws DniInvalido {
		int dni = 11111111;
		
		when(dtoInspectores.buscar(dni)).thenReturn(null);
		
		assertFalse(DniService.existeDniInspector(dni,dtoInspectores));
	}
}
