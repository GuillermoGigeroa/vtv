package com.gigeroa.vtv.rest;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.gigeroa.vtv.dto.DtoPropietariosImpl;
import com.gigeroa.vtv.entities.Propietario;

@RestController
@RequestMapping ("/propietarios")
public class PropietariosRest {
	@Autowired
	DtoPropietariosImpl dtoPropietarios;
	
	@RequestMapping (method = {RequestMethod.GET})
	public List<Propietario> listar () {
		return dtoPropietarios.listar();
	}

	@RequestMapping (value = {"/{dni}"}, method = {RequestMethod.GET})
	public Propietario buscar (@PathVariable Integer dni) {
		return dtoPropietarios.buscar(dni);
	}

	@RequestMapping (method = {RequestMethod.POST})
	public void agregar (@RequestBody Propietario propietario) {
		dtoPropietarios.guardar(propietario);
	}

	@RequestMapping (method = {RequestMethod.PUT})
	public void modificar (@RequestBody Propietario propietario) {
		dtoPropietarios.guardar(propietario);
	}

	@RequestMapping (value = {"{dni}"}, method = {RequestMethod.DELETE})
	public void eliminar (@PathVariable Integer dni) {
		dtoPropietarios.eliminar(dni);
	}
}
