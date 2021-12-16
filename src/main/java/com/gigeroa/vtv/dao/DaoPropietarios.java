package com.gigeroa.vtv.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.gigeroa.vtv.entities.*;

public class DaoPropietarios {

	private ConexionMySQL conectar;
	private final String listarPropietarios = "CALL SP_ListarPropietarios()";
	
	/*
	 * TODO Probar haciendo un callable statement
	 * private CallableStatement cst;
	 * private final String agregarPropietario = "CALL SP_AgregarPropietario(?,?,?,?)";
	 * cst = conectar.conexion().prepareCall("CALL SP_AgregarPropietario(?,?,?,?)");
	 * cst.setInt(1, int dniPropietario);
	 * cst.setString(2, String nombrePropietario);
	 * cst.setString(3, String apellidoPropietario);
	 * cst.setString(4, int exento);
	 * resultado = cst.executeQuery();
	 */

//	Constructor
	public DaoPropietarios() {
		conectar = new ConexionMySQL();
	}

//	Método para agregar un propietario
	public int agregarPropietario(Propietario propietario) {
		String query = "CALL SP_AgregarPropietario(" + propietario.getDni().getNumero() + ",'" + propietario.getNombre()
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
		return bajaPropietario(propietario.getDni().getNumero());
	}

//	Método sobrecargado para dar de baja un propietario con el id
	public int bajaPropietario(int dniPropietario) {
		String query = "CALL SP_BajaLogicaPropietario(" + dniPropietario + ",1)";
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
	public int modificarPropietario(int dni, String nuevoNombre, Boolean nuevoExento) {
		String query = "CALL SP_ModificarPropietario(" + dni
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
	public int modificarPropietario(int dni, Propietario propietario) {
		return modificarPropietario(dni, propietario.getNombre(), propietario.isExento());
	}

//	Método para listar los propietarios
	public ArrayList<Propietario> listarPropietarios() {
		ArrayList<Propietario> lista = new ArrayList<Propietario>();
		Propietario propietarioActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(listarPropietarios);
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
