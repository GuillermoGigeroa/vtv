package com.gigeroa.vtv.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import com.gigeroa.vtv.entities.*;

public class DaoInspecciones {

	private ConexionMySQL conectar;

//	Constructor
	public DaoInspecciones() {
		conectar = new ConexionMySQL();
	}

//	Método para agregar una inspección a la BBDD
	public int agregarInspeccion(Inspeccion inspeccion) {
		String query = "CALL SP_AgregarInspeccion('"
				+ inspeccion.getFecha().toString()
				+ "','" + inspeccion.getFechaVencimiento().toString()
				+ "'," + inspeccion.getInspector().getID()
				+ "," + inspeccion.getEstadoGeneral().getTipoEstado()
				+ "," + inspeccion.getVehiculo().getID() + ")";
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

//	Método para dar de baja una inspección en BBDD
	public int bajaInspeccion(Inspeccion inspeccion) {
		String query = "CALL SP_BajaLogicaInspeccion("+ inspeccion.getID() + ",1)";
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

//	Metodo sobrecargado para dar de baja una inspección solo con el id
	public int bajaInspeccion(int idInspeccion) {
		String query = "CALL SP_BajaLogicaInspeccion(" + idInspeccion + ",1)";
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

//	Método para modificar una inspección
	public int modificarInspeccion(int id, LocalDate fecha, int idNuevoInspector, int idNuevoEstado,
			int idNuevoVehiculo) {
		String query = "CALL SP_ModificarInspeccion(" + id
				+ ",'" + fecha.toString()
				+ "','" + fecha.plusYears(1).toString()
				+ "'," + idNuevoInspector
				+ "," + idNuevoEstado
				+ "," + idNuevoVehiculo + ")";
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

//	Método sobrecargado para dar modificar una inspección insertando otra inspección
	public int modificarInspeccion(int id, Inspeccion inspeccion) {
		String query = "CALL SP_ModificarInspeccion(" + id
				+ ",'" + inspeccion.getFecha().toString()
				+ "','" + inspeccion.getFechaVencimiento().toString()
				+ "'," + inspeccion.getInspector().getID()
				+ "," + inspeccion.getEstadoGeneral().getTipoEstado()
				+ "," + inspeccion.getVehiculo().getID() + ")";
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

//	Método para listar las inspecciones por fecha
	public ArrayList<Inspeccion> listarInspeccionesPorFecha(LocalDate fechaIngresada) {
		ArrayList<Inspeccion> lista = new ArrayList<Inspeccion>();
		String query = "CALL SP_ListarInspeccionesPorFecha('" + fechaIngresada.toString() + "')";
		Propietario propietario;
		Vehiculo vehiculoActual;
		Inspector inspectorActual;
		LocalDate fecha;
		int numeroInspeccion;
		EstadoGeneral estado;
		Inspeccion inspeccionActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				inspectorActual = new Inspector(
						resultado.getInt("DNIInspector"),
						resultado.getString("Inspector"));
				propietario = new Propietario(
						resultado.getInt("DNIPropietario"),
						resultado.getString("NombrePropietario"),
						resultado.getBoolean("Exento"));
				vehiculoActual = new Vehiculo(
						resultado.getInt("IDVehiculo"),
						resultado.getString("Dominio"),
						resultado.getString("Marca"),
						resultado.getString("Modelo"),
						propietario);
				numeroInspeccion = resultado.getInt("NumeroInspeccion");
				fecha = LocalDate.parse(resultado.getString("Fecha"));
				estado = new EstadoGeneral(resultado.getInt("Estado"));
				
				inspeccionActual = new Inspeccion(
						numeroInspeccion,
						fecha,
						inspectorActual,
						vehiculoActual,
						estado);
				lista.add(inspeccionActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}

//	Método para listar las inspecciones
	public ArrayList<Inspeccion> listarInspecciones() {
		ArrayList<Inspeccion> lista = new ArrayList<Inspeccion>();
		String query = "CALL SP_ListarInspecciones()";
		Propietario propietario;
		Vehiculo vehiculoActual;
		Inspector inspectorActual;
		LocalDate fecha;
		int numeroInspeccion;
		EstadoGeneral estado;
		Inspeccion inspeccionActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				inspectorActual = new Inspector(
						resultado.getInt("DNIInspector"),
						resultado.getString("Inspector"));
				propietario = new Propietario(
						resultado.getInt("DNIPropietario"),
						resultado.getString("NombrePropietario"),
						resultado.getBoolean("Exento"));
				vehiculoActual = new Vehiculo(
						resultado.getInt("IDVehiculo"),
						resultado.getString("Dominio"),
						resultado.getString("Marca"),
						resultado.getString("Modelo"),
						propietario);
				numeroInspeccion = resultado.getInt("NumeroInspeccion");
				fecha = LocalDate.parse(resultado.getString("Fecha"));
				estado = new EstadoGeneral(resultado.getInt("Estado"));
				
				inspeccionActual = new Inspeccion(
						numeroInspeccion, 
						fecha, 
						inspectorActual, 
						vehiculoActual, 
						estado);
				lista.add(inspeccionActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}

//	Método para listar las inspecciones por propietario
	public ArrayList<Inspeccion> listarInspeccionesPorPropietario(int IDPropietario) {
		ArrayList<Inspeccion> lista = new ArrayList<Inspeccion>();
		String query = "CALL SP_ListarInspeccionesPorPropietario(" + IDPropietario + ")";
		Propietario propietario;
		Vehiculo vehiculoActual;
		Inspector inspectorActual;
		LocalDate fecha;
		int numeroInspeccion;
		EstadoGeneral estado;
		Inspeccion inspeccionActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				inspectorActual = new Inspector(
						resultado.getInt("DNIInspector"),
						resultado.getString("Inspector"));
				propietario = new Propietario(
						resultado.getInt("DNIPropietario"),
						resultado.getString("NombrePropietario"),
						resultado.getBoolean("Exento"));
				vehiculoActual = new Vehiculo(
						resultado.getInt("IDVehiculo"),
						resultado.getString("Dominio"),
						resultado.getString("Marca"),
						resultado.getString("Modelo"),
						propietario);
				numeroInspeccion = resultado.getInt("NumeroInspeccion");
				fecha = LocalDate.parse(resultado.getString("Fecha"));
				estado = new EstadoGeneral(resultado.getInt("Estado"));
				
				inspeccionActual = new Inspeccion(
						numeroInspeccion, 
						fecha, 
						inspectorActual, 
						vehiculoActual, 
						estado);
				lista.add(inspeccionActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}

//	Metodo sobrecargado para listar las inspecciones por propietario ingresando
//	un objeto propietario
	public ArrayList<Inspeccion> listarInspeccionesPorPropietario(Propietario propietario) {
		ArrayList<Inspeccion> lista = new ArrayList<Inspeccion>();
		String query = "CALL SP_ListarInspeccionesPorPropietario(" + propietario.getID() + ")";
		Propietario propietarioSistema;
		Vehiculo vehiculoActual;
		Inspector inspectorActual;
		LocalDate fecha;
		int numeroInspeccion;
		EstadoGeneral estado;
		Inspeccion inspeccionActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				inspectorActual = new Inspector(
						resultado.getInt("DNIInspector"), 
						resultado.getString("Inspector"));
				propietarioSistema = new Propietario(
						resultado.getInt("DNIPropietario"),
						resultado.getString("NombrePropietario"), 
						resultado.getBoolean("Exento"));
				vehiculoActual = new Vehiculo(
						resultado.getInt("IDVehiculo"), 
						resultado.getString("Dominio"),
						resultado.getString("Marca"), 
						resultado.getString("Modelo"), 
						propietarioSistema);
				numeroInspeccion = resultado.getInt("NumeroInspeccion");
				fecha = LocalDate.parse(resultado.getString("Fecha"));
				estado = new EstadoGeneral(resultado.getInt("Estado"));
				
				inspeccionActual = new Inspeccion(
						numeroInspeccion, 
						fecha, 
						inspectorActual, 
						vehiculoActual, 
						estado);
				lista.add(inspeccionActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}

}
