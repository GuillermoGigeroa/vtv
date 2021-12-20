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

//	Método para listar los modelos segun el ID de la marca
	public ArrayList<ModeloVehiculo> listarModelos (int ID_Marca) {
		ArrayList<ModeloVehiculo> lista = new ArrayList<ModeloVehiculo>();
		String query = "CALL SP_ListarModelos("+ID_Marca+")";
		ModeloVehiculo modeloActual;
		try {
			Statement st = conectar.conexion().createStatement();
			ResultSet resultado = st.executeQuery(query);
			while (resultado.next()) {
				modeloActual = new ModeloVehiculo(resultado.getInt("IDModelo"), resultado.getString("NombreModelo"));
				lista.add(modeloActual);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		conectar.cerrar();
		return lista;
	}
}
