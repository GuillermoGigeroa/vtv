package com.gigeroa.vtv.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.gigeroa.vtv.entities.*;

public class DaoPropietarios {

	private ConexionMySQL conectar;

//	Constructor
	public DaoPropietarios() {
		conectar = new ConexionMySQL();
	}

//	Método para agregar un propietario
	public int agregarPropietario(Propietario propietario) {
		String query = "CALL SP_AgregarPropietario(" + propietario.getID() + ",'" + propietario.getNombre()
						+ "'," + propietario.isExento() + ")";
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

//	Método para dar de baja un propietario
	public int bajaPropietario(Propietario propietario) {
		String query = "CALL SP_BajaLogicaPropietario(" + propietario.getID() + ",1)";
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

//	Método sobrecargado para dar de baja un propietario con el id
	public int bajaPropietario(int idPropietario) {
		String query = "CALL SP_BajaLogicaPropietario(" + idPropietario + ",1)";
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

//	Método para modificar un propietario
	public int modificarPropietario(int id, String nuevoNombre, Boolean nuevoExento) {
		String query = "CALL SP_ModificarPropietario(" + id
						+ ",'" + nuevoNombre
						+ "'," + nuevoExento + ")";
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

//	Método sobrecargado para modificar un propietario insertando otro
//	propietario
	public int modificarPropietario(int id, Propietario propietario) {
		String query = "CALL SP_ModificarPropietario(" + id
						+ ",'" + propietario.getNombre()
						+ "'," + propietario.isExento() + ")";
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

//	Método para listar los propietarios
	public ArrayList<Propietario> listarPropietarios() {
		ArrayList<Propietario> lista = new ArrayList<Propietario>();
		String query = "CALL SP_ListarPropietarios()";
		Propietario propietarioActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				propietarioActual = new Propietario(
						resultado.getInt("DNI"),
						resultado.getString("Nombre"),
						resultado.getBoolean("Exento"));
				lista.add(propietarioActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}

}
