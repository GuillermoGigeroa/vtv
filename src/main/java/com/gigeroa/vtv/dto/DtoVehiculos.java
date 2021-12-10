package com.gigeroa.vtv.dto;

import com.gigeroa.vtv.dao.DaoVehiculos;
import com.gigeroa.vtv.entities.*;
import java.util.ArrayList;

public class DtoVehiculos {
	private DaoVehiculos dao;

//	Constructor
	public DtoVehiculos() {
		dao = new DaoVehiculos();
	}

//	Método para agregar un vehiculo
	public int agregarVehiculo(Vehiculo vehiculo) {
		return dao.agregarVehiculo(vehiculo);
	}

//	Método para dar de baja un vehiculo
	public int bajaVehiculo(Vehiculo vehiculo) {
		return dao.bajaVehiculo(vehiculo);
	}

//	Método sobrecargado para dar de baja un vehiculo solo ingresando id
	public int bajaVehiculo(int idVehiculo) {
		return dao.bajaVehiculo(idVehiculo);
	}

//	Método para dar modificar un vehiculo
	public int modificarVehiculo(int id, String nuevoDominio, String nuevaMarca, String nuevoModelo) {
		return dao.modificarVehiculo(id, nuevoDominio, nuevaMarca, nuevoModelo);
	}
	
//	Método sobrecargado para modificar un vehiculo insertando otro vehiculo
	public int modificarVehiculo(int id, Vehiculo vehiculo) {
		return dao.modificarVehiculo(id, vehiculo);
	}
	
//	Método para listar los vehiculos
	public ArrayList<Vehiculo> listarVehiculos(){
		return dao.listarVehiculos();
	}

//	Método sobrecargado para listar ingresando un propietario
	public ArrayList<Vehiculo> listarVehiculosPorPropietario(Propietario propietario) {
		return dao.listarVehiculosPorPropietario(propietario);
	}
	
//	Método sobrecargado para listar vehiculos por id de propietario
	public ArrayList<Vehiculo> listarVehiculosPorPropietario(int IDPropietario) {
		return dao.listarVehiculosPorPropietario(IDPropietario);
	}
	
//	Método para listar los vehiculos por estado
	public ArrayList<Vehiculo> listarVehiculosPorEstado(int IDEstado){
		return dao.listarVehiculosPorEstado(IDEstado);
	}
	
//	Método sobrecargado para listar los vehiculos por estado con un objeto Estado
	public ArrayList<Vehiculo> listarVehiculosPorEstado(Estado estado){
		return dao.listarVehiculosPorEstado(estado);
	}
}
