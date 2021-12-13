package com.gigeroa.vtv.repositories;

/*
 *	Interfaz creada para poder cargar los datos de
 *	la BBDD que necesitamos conectar al proyecto.
 */

public interface IConexion {
	final String host = "localhost/";
	final String user = "root";
	final String pass = "root";
	final String dbName = "vtv";
	final String url = "jdbc:mysql://" + host + dbName;
}
