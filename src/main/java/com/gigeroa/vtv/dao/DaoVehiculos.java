package com.gigeroa.vtv.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.gigeroa.vtv.entities.*;

public class DaoVehiculos {

	private ConexionMySQL conectar;

//	Constructor
	public DaoVehiculos() {
		conectar = new ConexionMySQL();
	}

//	Método para agregar un vehiculo
	public int agregarVehiculo(Vehiculo vehiculo) {
		String query = "CALL SP_AgregarVehiculo('" + vehiculo.getDominio()
						+ "','" + vehiculo.getMarca()
						+ "','" + vehiculo.getModelo()
						+ "'," + vehiculo.getPropietario().getID() + ")";
		int filas = 0;
		try {
			Statement st = conectar.conexion().createStatement();
			filas = st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return filas;
	}

//	Método para dar de baja un vehiculo
	public int bajaVehiculo(Vehiculo vehiculo) {
		String query = "CALL SP_BajaLogicaVehiculo(" + vehiculo.getID() + ",1)";
		int filas = 0;
		try {
			Statement st = conectar.conexion().createStatement();
			filas = st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return filas;
	}

//	Método sobrecargado para dar de baja un vehiculo solo ingresando id
	public int bajaVehiculo(int idVehiculo) {
		String query = "CALL SP_BajaLogicaVehiculo(" + idVehiculo + ",1)";
		int filas = 0;
		try {
			Statement st = conectar.conexion().createStatement();
			filas = st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return filas;
	}

//	Método para modificar un vehiculo
	public int modificarVehiculo(int id, String nuevoDominio, String nuevaMarca, String nuevoModelo) {
		String query = "CALL SP_ModificarVehiculo(" + id
						+ ",'" + nuevoDominio
						+ ",'" + nuevaMarca
						+ ",'" + nuevoModelo + "')";
		int filas = 0;
		try {
			Statement st = conectar.conexion().createStatement();
			filas = st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return filas;
	}

//	Método sobrecargado para modificar un vehiculo insertando otro vehiculo
	public int modificarVehiculo(int id, Vehiculo vehiculo) {
		String query = "CALL SP_ModificarVehiculo(" + id
						+ ",'" + vehiculo.getDominio()
						+ "','" + vehiculo.getMarca()
						+ "','" + vehiculo.getModelo() + "')";
		int filas = 0;
		try {
			Statement st = conectar.conexion().createStatement();
			filas = st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return filas;
	}

//	Método para listar los vehiculos
	public ArrayList<Vehiculo> listarVehiculos() {
		ArrayList<Vehiculo> lista = new ArrayList<Vehiculo>();
		String query = "CALL SP_ListarVehiculos()";
		Vehiculo vehiculoActual;
		Propietario propietarioActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				propietarioActual = new Propietario(
						resultado.getInt("IDPropietario"),
						resultado.getString("NombrePropietario"),
						resultado.getBoolean("Exento"));
				vehiculoActual = new Vehiculo(
						resultado.getInt("IDVehiculo"),
						resultado.getString("Dominio"),
						resultado.getString("Marca"),
						resultado.getString("Modelo"),
						propietarioActual);
				lista.add(vehiculoActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}

//	Método sobrecargado para listar vehiculos ingresando un propietario
	public ArrayList<Vehiculo> listarVehiculosPorPropietario(Propietario propietario) {
		ArrayList<Vehiculo> lista = new ArrayList<Vehiculo>();
		String query = "CALL SP_ListarVehiculosPorPropietario(" + propietario.getID() + ")";
		Vehiculo vehiculoActual;
		Propietario propietarioActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				propietarioActual = new Propietario(
						resultado.getInt("IDPropietario"),
						resultado.getString("NombrePropietario"),
						resultado.getBoolean("Exento"));
				vehiculoActual = new Vehiculo(
						resultado.getInt("IDVehiculo"),
						resultado.getString("Dominio"),
						resultado.getString("Marca"),
						resultado.getString("Modelo"),
						propietarioActual);
				lista.add(vehiculoActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}

//	Método sobrecargado para listar vehiculos por id de propietario
	public ArrayList<Vehiculo> listarVehiculosPorPropietario(int IDPropietario) {
		ArrayList<Vehiculo> lista = new ArrayList<Vehiculo>();
		String query = "CALL SP_ListarVehiculosPorPropietario(" + IDPropietario + ")";
		Vehiculo vehiculoActual;
		Propietario propietarioActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				propietarioActual = new Propietario(
						resultado.getInt("IDPropietario"),
						resultado.getString("NombrePropietario"),
						resultado.getBoolean("Exento"));
				vehiculoActual = new Vehiculo(
						resultado.getInt("IDVehiculo"),
						resultado.getString("Dominio"),
						resultado.getString("Marca"),
						resultado.getString("Modelo"),
						propietarioActual);
				lista.add(vehiculoActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}

//	Método para listar los vehiculos por estado
	public ArrayList<Vehiculo> listarVehiculosPorEstado(int IDEstado) {
		ArrayList<Vehiculo> lista = new ArrayList<Vehiculo>();
		String query = "CALL SP_ListarVehiculosPorEstado(" + IDEstado + ")";
		Vehiculo vehiculoActual;
		Propietario propietarioActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				propietarioActual = new Propietario(
						resultado.getInt("IDPropietario"),
						resultado.getString("NombrePropietario"),
						resultado.getBoolean("Exento"));
				vehiculoActual = new Vehiculo(
						resultado.getInt("IDVehiculo"),
						resultado.getString("Dominio"),
						resultado.getString("Marca"),
						resultado.getString("Modelo"),
						propietarioActual);
				lista.add(vehiculoActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}

//	Método sobrecargado para listar los vehiculos por estado con un objeto del tipo Estado
	public ArrayList<Vehiculo> listarVehiculosPorEstado(Estado estado) {
		ArrayList<Vehiculo> lista = new ArrayList<Vehiculo>();
		String query = "CALL SP_ListarVehiculosPorEstado(" + estado.getTipoEstado() + ")";
		Vehiculo vehiculoActual;
		Propietario propietarioActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				propietarioActual = new Propietario(
						resultado.getInt("IDPropietario"),
						resultado.getString("NombrePropietario"),
						resultado.getBoolean("Exento"));
				vehiculoActual = new Vehiculo(
						resultado.getInt("IDVehiculo"),
						resultado.getString("Dominio"),
						resultado.getString("Marca"),
						resultado.getString("Modelo"),
						propietarioActual);
				lista.add(vehiculoActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}

}
