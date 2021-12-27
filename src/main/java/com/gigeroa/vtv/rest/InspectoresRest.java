package com.gigeroa.vtv.rest;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.gigeroa.vtv.dto.DtoInspectoresImpl;
import com.gigeroa.vtv.entities.Inspector;

@RestController
@RequestMapping ("/api/inspectores")
public class InspectoresRest {
	@Autowired
	DtoInspectoresImpl dtoInspectores;
	
	@RequestMapping (method = {RequestMethod.GET})
	public List<Inspector> listar () {
		return dtoInspectores.listar();
	}

	@RequestMapping (value = {"/{legajo}"}, method = {RequestMethod.GET})
	public Inspector buscar (@PathVariable Integer legajo) {
		return dtoInspectores.buscar(legajo);
	}

	@RequestMapping (method = {RequestMethod.POST})
	public void agregar (@RequestBody Inspector inspector) {
		dtoInspectores.guardar(inspector);
	}

	@RequestMapping (method = {RequestMethod.PUT})
	public void modificar (@RequestBody Inspector inspector) {
		dtoInspectores.guardar(inspector);
	}

	@RequestMapping (value = {"{legajo}"}, method = {RequestMethod.DELETE})
	public void eliminar (@PathVariable Integer legajo) {
		dtoInspectores.eliminar(legajo);
	}
}
