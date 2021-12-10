package com.gigeroa.vtv.repositories;

/*
 *	Interfaz creada para identificar los elementos que contienen ID
 *	para poder ser utilizados en conjunto con la BBDD.
 */

public interface IContieneID {
	int getID();
	void setID(int id);
}
