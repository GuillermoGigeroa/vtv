package com.gigeroa.vtv.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionMySQL {
	private final String host = "localhost/";
	private final String user = "root";
	private final String pass = "root";
	private final String dbName = "VTV";
	private final String url = "jdbc:mysql://" + host + dbName;
	private Connection conectar;

//	Metodo conectar
	public Connection conexion() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.conectar = DriverManager.getConnection(this.url, this.user, this.pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this.conectar;
	}

//	Metodo para cerrar conexion
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
