package com.gigeroa.vtv.dao;

import java.sql.Connection;
import java.sql.DriverManager;

import com.gigeroa.vtv.repositories.IConexion;

public class ConexionMySQL implements IConexion{
	private Connection conectar;

//	Constructor
	public ConexionMySQL() {}

//	Método para abrir conexión
	public Connection conexion() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.conectar = DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.conectar;
	}

//	Método para cerrar conexión
	public void cerrar() {
		if (this.conectar != null) {
			try {
				this.conectar.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
