package com.gigeroa.vtv.web;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.Propietario;
import com.gigeroa.vtv.entities.Vehiculo;
import com.gigeroa.vtv.exceptions.DniInvalido;

@Controller
public class HomeController {
	private final String titulo = "Inicio - Proyecto VTV";
	
	@GetMapping ("/")
	public String inicio(Model model) {
//		Se agrega un título para mostrar.
		model.addAttribute("titulo", titulo);

//		Se agrega un mensaje para mostrar.
		String mensaje = "Hola, este es un mensaje de prueba.";
		model.addAttribute("mensaje", mensaje);

//		Se prueba cargar un dato desde la base de datos
		Vehiculo vehiculo = null;
		try {
			vehiculo = ((new DtoVehiculos()).listarVehiculos()).get(0);			
		}
		catch (Exception error){
			try {
				vehiculo = new Vehiculo("AA123AA", "Marca", "Modelo", new Propietario(11222333, "Nombre", false));
			} catch (DniInvalido dniInvalido) {
				dniInvalido.printStackTrace();
			}
		}
		model.addAttribute("vehiculo", vehiculo);
		model.addAttribute("propietario", vehiculo.getPropietario());

		return "index";
	}
}
