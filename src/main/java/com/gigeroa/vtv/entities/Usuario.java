package com.gigeroa.vtv.entities;

enum Usuario {
	/*
	 * TODO Continuar con la implementación de esta clase
	 * La idea es crear una interface IUsuario que tenga los campos:
	 * public static int tipoAdmin = 1;
	 * public static int tipoUsuario = 2;
	 * public static int tipoInterno = 3;
	 * int getTipo();
	 * void setTipo(int tipo);
	 * String getUserName();
	 * void setUserName(String userName);
	 * String getPassword();
	 * void setPassword(String password);
	 * 
	 * Usuario implementa IUsuario
	 * 
	 * TODO Se debe crear un método para encriptar la clave camino a la BBDD
	 * Metodo encriptar: String encriptar(String password);
	 * 
	 * Tipos de usuarios y permisos (A: Alta, B: Baja, M: Modificación, L: Listado)
	 * ADMIN:
	 * > Acceso total a todas las herramientas
	 * 
	 * USUARIO:
	 * > Inspecciones (A-M-L)
	 * > Propietario (A-B-M-L)
	 * > Vehiculos (A-B-M-L)
	 * > Inspectores (L)
	 * 
	 * INTERNO:
	 * > Propietarios (L)
	 * > Vehiculos (L)
	 * > Inspecciones (A-L)
	 */
	ADMIN("admin","admin"), USUARIO("user","user"), INTERNO("interno","interno");

	private String userName;
	private String password;
	
	private Usuario(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public String getPassword() {
		return password;
		
	}
}
