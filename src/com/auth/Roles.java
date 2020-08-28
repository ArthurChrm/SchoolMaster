package com.auth;

public enum Roles {
	ADMIN(1),
	DIRECTEUR(2),
	PROF(3),
	ELEVE(4);
	
	int id;
	Roles(int id){
		this.id = id;
	}
	
	public int getId() {
		return id;
	}
}
