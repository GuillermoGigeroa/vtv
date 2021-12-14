package com.gigeroa.vtv.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.gigeroa.vtv.dto.DtoVehiculos;
import com.gigeroa.vtv.entities.Propietario;
import com.gigeroa.vtv.entities.Vehiculo;
import com.gigeroa.vtv.exceptions.DniInvalido;
import com.gigeroa.vtv.exceptions.MatriculaInvalida;

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
		Propietario propietario = null;
		try {
			vehiculo = ((new DtoVehiculos()).listarVehiculos()).get(0);
			propietario = vehiculo.getPropietario();
		}
		catch (Exception error){
			try {
				propietario = new Propietario(11222333, "Nombre", false);
				vehiculo = new Vehiculo("AA123AA", "Marca", "Modelo", propietario);
			} catch (DniInvalido | MatriculaInvalida e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("vehiculo", vehiculo);
		model.addAttribute("propietario", propietario);

		return "index";
	}
}
