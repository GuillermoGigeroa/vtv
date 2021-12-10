package com.gigeroa.vtv.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.gigeroa.vtv.entities.*;

public class DaoInspectores {

	private ConexionMySQL conectar;

//	Constructor
	public DaoInspectores() {
		conectar = new ConexionMySQL();
	}

//	Método para agregar un inspector
	public int agregarInspector(Inspector inspector) {
		String query = "CALL SP_AgregarInspector('" + inspector.getNombre() + "')";
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

//	Método para dar de baja un inspector
	public int bajaInspector(Inspector inspector) {
		String query = "CALL SP_BajaLogicaInspector(" + inspector.getID() + ",1)";
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

//	Método sobrecargado para dar de baja un inspector solo con el id
	public int bajaInspector(int idInspector) {
		String query = "CALL SP_BajaLogicaInspector(" + idInspector + ",1)";
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

//	Método para modificar un inspector
	public int modificarInspector(int id, String nuevoNombre) {
		String query = "CALL SP_ModificarInspector(" + id + ",'" + nuevoNombre + "')";
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

//	Método sobrecargado para modificar un inspector insertando otro inspector
	public int modificarInspector(int id, Inspector inspector) {
		String query = "CALL SP_ModificarInspector(" + id
				+ ",'" + inspector.getNombre() + "')";
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

//	Método para listar los inspectores
	public ArrayList<Inspector> listarInspectores() {
		ArrayList<Inspector> lista = new ArrayList<Inspector>();
		String query = "CALL SP_ListarInspectores()";
		Inspector inspectorActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				inspectorActual = new Inspector(
						resultado.getInt("ID"),
						resultado.getString("Nombre"));
				lista.add(inspectorActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}
}
