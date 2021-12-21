package com.gigeroa.vtv.services;

import org.springframework.ui.Model;

public abstract class ControllersService {
//	Método para definir el título a utilizar en la página
	public static void setTitulo (Model model, String titulo) {
		model.addAttribute("titulo",titulo);
	}
}
