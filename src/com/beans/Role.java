package com.beans;

import com.auth.Roles;

public class Role {
	private int id;
	private String nom;
	
	public Role() {
		
	}

	public Role(int id, String nom) {
		super();
		this.id = id;
		this.nom = nom;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public Roles getEnum() {
		return Roles.values()[this.id-1];
	}
	
}
